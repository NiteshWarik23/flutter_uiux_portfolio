import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/dependency_injection/dependency_injection.dart';
import 'package:my_portfolio/modules/about_me/presentation/bloc/tabbar_bloc/tab_bloc.dart';
import 'package:my_portfolio/modules/about_me/presentation/bloc/tabbar_bloc/tab_event.dart';
import 'package:my_portfolio/modules/about_me/presentation/bloc/tabbar_bloc/tab_state.dart';
import 'package:my_portfolio/modules/about_me/presentation/view/about_me.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'dart:html' as html; // For web redirection

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final TabBarBloc tabBarBloc = locator<TabBarBloc>();
  bool isSelected = false;
  final List<Widget> _screens = [
    LandingPageView(),
    AboutMe(),
    //SideBar(),
    Center(child: Text("This is Contact Page", style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => tabBarBloc,
      child: Scaffold(
        backgroundColor: Color(0xff031420),
        appBar: AppBar(
          backgroundColor: Color(0xff031420),
          toolbarHeight: 45.0,
          flexibleSpace: appBarWidget(context),
        ),
        body: BlocBuilder<TabBarBloc, TabBarState>(
          builder: (context, state) {
            if (state is TabChangedState) {
              return _screens[state.selectedIndex];
            }
            return _screens[0];
          },
        ),
        bottomNavigationBar: customBottomNavBarWidget(context),
      ),
    );
  }

  SizedBox customBottomNavBarWidget(BuildContext context) {
    return SizedBox(
        height: AppBar().preferredSize.height * 0.8,
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.001,
              color: Color(0xff607B96),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.08,
                      child: Text(
                        "find me in:",
                        style: GoogleFonts.firaCode(
                            color: Color(0xff607B96), fontSize: 14),
                      )),
                  verticalDividerWidget(context),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.05,
                    child: SvgPicture.asset(
                      'assets/icons/X.svg',
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                      colorFilter: const ColorFilter.mode(
                          Color(0xff607B96), BlendMode.srcIn),
                    ),
                  ),
                  verticalDividerWidget(context),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.05,
                    child: SvgPicture.asset(
                      'assets/icons/facebook.svg',
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  verticalDividerWidget(context),
                  Spacer(),
                  verticalDividerWidget(context),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5.0,
                      children: [
                        Text(
                          "@username",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.firaCode(
                              color: Color(0xff607B96), fontSize: 14),
                        ),
                        SvgPicture.asset(
                          'assets/icons/github.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  Column appBarWidget(BuildContext context) {
    return Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      child: Text(
                        "nitesh_kishor_warik",
                        style: GoogleFonts.firaCode(
                            color: Color(0xff607B96), fontSize: 14),
                      )),
                  verticalDividerWidget(context),
                  //hello tab
                  tabsWidget(
                    context,
                    widthOfSizedBox: MediaQuery.sizeOf(context).width * 0.05,
                    textToBeShownInTab: '_hello',
                    currentIndex: 0,
                  ),
                  verticalDividerWidget(context),
                  //about me tab
                  tabsWidget(
                    context,
                    widthOfSizedBox: MediaQuery.sizeOf(context).width * 0.07,
                    textToBeShownInTab: '_about-me',
                    currentIndex: 1,
                  ),
                  verticalDividerWidget(context),
                  //projects tab
                  tabsWidget(
                    context,
                    widthOfSizedBox: MediaQuery.sizeOf(context).width * 0.07,
                    textToBeShownInTab: '_projects',
                    currentIndex: 2,
                  ),
                  verticalDividerWidget(context),
                  Spacer(),
                  verticalDividerWidget(context),
                  //contact me tab
                  tabsWidget(
                    context,
                    widthOfSizedBox: MediaQuery.sizeOf(context).width * 0.1,
                    textToBeShownInTab: '_contact-me',
                    currentIndex: 3,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.001,
              color: Color(0xff607B96),
            )
          ],
        );
  }

  Widget tabsWidget(BuildContext context,
      {required double widthOfSizedBox,
      required String textToBeShownInTab,
      required int currentIndex}) {
    return BlocBuilder<TabBarBloc, TabBarState>(
      builder: (context, state) {
        if (state is TabChangedState) {
          isSelected = state.selectedIndex == currentIndex;
        }
        return customTabWidget(isSelected, widthOfSizedBox, textToBeShownInTab,
            currentIndex, context);
      },
    );
  }

  Widget customTabWidget(bool isTabSelected, double widthOfSizedBox,
      String textToBeShownInTab, int currentIndex, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MouseRegion(
          cursor:
              SystemMouseCursors.click, // 👈 This changes the cursor to a hand
          child: GestureDetector(
            onTap: () {
              tabBarBloc.add(TabChangedEvent(currentIndex));
            },
            child: SizedBox(
              width: widthOfSizedBox,
              child: Padding(
                padding: EdgeInsets.only(top: isTabSelected ? 12.0 : 12.0),
                child: Text(
                  textToBeShownInTab,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.firaCode(
                      color: isTabSelected ? Colors.white : Color(0xff607B96),
                      fontSize: 14),
                ),
              ),
            ),
          ),
        ),
        isTabSelected
            ? Container(
                width: widthOfSizedBox,
                height: AppBar().preferredSize.height * 0.03,
                color: Color(0xffFEA55F),
              )
            : SizedBox(),
      ],
    );
  }

  Widget verticalDividerWidget(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height,
      width: MediaQuery.sizeOf(context).width * 0.001,
      color: Color(0xff607B96),
    );
  }
}

class LandingPageView extends StatelessWidget {
  const LandingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Color(0xff031420),
                          Color(0xff031420),
                        ],
                        // begin: Alignment.topCenter,
                        // end: Alignment.bottomCenter,
                        // stops: [0.5, 0.5],
                        // tileMode: TileMode.clamp,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4.0,
                        children: [
                          Text(
                            "Hi all, I'm",
                            style: GoogleFonts.firaCode(
                                color: Color(0xffE5E9F0), fontSize: 16),
                          ),
                          Text(
                            "Nitesh K Warik",
                            style: GoogleFonts.firaCode(
                                color: Color(0xffE5E9F0), fontSize: 45),
                          ),
                          Text(
                            "> Flutter Developer & UX/UI Designer",
                            style: GoogleFonts.firaCode(
                                color: Color(0xff4D5BCE), fontSize: 28),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.1,
                          ),
                          Text(
                            "// complete the game to continue",
                            style: GoogleFonts.firaCode(
                                color: Color(0xff607B96), fontSize: 16),
                          ),
                          Text(
                            "// you can also see it on my Github page",
                            style: GoogleFonts.firaCode(
                                color: Color(0xff607B96), fontSize: 16),
                          ),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.firaCode(fontSize: 16),
                              children: [
                                TextSpan(
                                  text: "const ",
                                  style: TextStyle(
                                      color: Color(0xff4D5BCE)), // 4D5BCE
                                ),
                                TextSpan(
                                  text: "githubLink ",
                                  style: TextStyle(
                                      color: Color(0xff43D9AD)), // 43D9AD
                                ),
                                TextSpan(
                                  text: "= ",
                                  style:
                                      TextStyle(color: Colors.white), // White
                                ),
                                TextSpan(
                                  text: "\"https://github.com/example/url\"",
                                  style: TextStyle(color: Color(0xffE99287)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => openGitHub(),
                                ),
                                TextSpan(
                                  text: ";",
                                  style:
                                      TextStyle(color: Colors.white), // White
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Color(0xff00436D),
                          Color(0xff031420),
                        ],
                        // stops: [0.5, 0.5],
                        // begin: Alignment.topCenter,
                        // end: Alignment.bottomCenter,
                        // tileMode: TileMode.clamp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Stack for Radial Gradients
            Positioned(
              top: constraints.maxHeight * 0.25, // Move slightly lower
              right: constraints.maxWidth * 0.1,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    radius: 0.4,
                    colors: [Color(0xff4D5BCE), Color(0xff011627)],
                    stops: [0.1, 0.9],
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterLogo(),
                      Text(
                        "Flutter",
                        style: GoogleFonts.firaCode(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: constraints.maxHeight * 0.1, // Move slightly up
              left: constraints.maxWidth * 0.3,
              right: constraints.maxHeight * 0.02,
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    radius: 0.5,
                    colors: [Color(0xff43D9AD), Color(0xff011627)],
                    stops: [0.1, 0.9],
                  ),
                ),
                child: Center(
                  child: Text(
                    "UI/UX",
                    style: GoogleFonts.firaCode(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void openGitHub() async {
    final String url = "https://github.com/NiteshWarik23";
    // if (kIsWeb) {
    //   html.window.open(url, "_blank"); // Opens in a new tab for Flutter Web
    // } else {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        throw "Could not launch $url";
      }
   // }
  }
}

class GradientStackScreen extends StatelessWidget {
  const GradientStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            // alignment: Alignment.center,
            children: [
              // First Gradient - Slightly at the top
              Positioned(
                top: constraints.maxHeight * 0.2, // Move slightly up
                left: constraints.maxWidth * 0.2,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      radius: 0.5,
                      colors: [Color(0xff43D9AD), Color(0xff011627)],
                      stops: [0.2, 1.0],
                    ),
                  ),
                ),
              ),

              // Second Gradient - Centered
              Positioned(
                top: constraints.maxHeight * 0.25, // Move slightly lower
                right: constraints.maxWidth * 0.2,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      radius: 0.4,
                      colors: [Color(0xffFCA311), Color(0xff011627)],
                      stops: [0.1, 1.0],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class GradientStackPage extends StatelessWidget {
  const GradientStackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff011627),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.topCenter, // Aligns everything at the top
            children: [
              // Background Linear Gradients Split into Two
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff5a0dbe),
                            Color(0xff004773),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff00436D),
                            Color(0xff031420),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Stack for Radial Gradients
              Positioned(
                top: constraints.maxHeight * 0.2, // Move slightly up
                left: constraints.maxWidth * 0.2,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      radius: 0.5,
                      colors: [Color(0xff43D9AD), Color(0xff011627)],
                      stops: [0.1, 0.9],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: constraints.maxHeight * 0.25, // Move slightly lower
                right: constraints.maxWidth * 0.2,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      radius: 0.4,
                      colors: [Color(0xff4D5BCE), Color(0xff011627)],
                      stops: [0.1, 0.9],
                    ),
                  ),
                ),
              ),

              // Content Section
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Hello, I'm Nitesh",
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
