import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/landing_page.dart';
import 'package:my_portfolio/widgets/download_resume_button.dart';
import 'package:my_portfolio/widgets/marquee_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class MobileView extends StatelessWidget {
  const MobileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031420),
      appBar: customAppBarWidget(context),
      bottomNavigationBar: customBottomNavBarWidget(context),
      endDrawer: Drawer(
        backgroundColor: Color(0xff031420),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff031420),
              ),
              child: Column(
                spacing: 5.0,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                  ),
                  Text(
                    'Nitesh Kishor Warik',
                    style: GoogleFonts.firaCode(
                      color: Color(0xff607B96),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_2_rounded, color: Color(0xff607B96)),
              title: Text('About Me',
                  style: GoogleFonts.firaCode(color: Color(0xff607B96))),
              onTap: () {
                // Handle home tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutMeMobileView(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.mail, color: Color(0xff607B96)),
              title: Text('Contact Me',
                  style: GoogleFonts.firaCode(color: Color(0xff607B96))),
              onTap: () {
                // Handle about me tap
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AboutMeMobileView(),
                //   ),
                // );
              },
            ),
            // Add more menu items here
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.0,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              Text(
                "Hi, I'm",
                style: GoogleFonts.firaCode(
                    color: Color(0xffE5E9F0), fontSize: 16),
              ),
              Text(
                "Nitesh K Warik",
                style: GoogleFonts.firaCode(
                    color: Color(0xffE5E9F0), fontSize: 30),
              ),
              Text(
                "> Experienced Flutter Developer,",
                style: GoogleFonts.firaCode(
                    color: Color(0xff4D5BCE), fontSize: 16),
              ),
              Text(
                "UI/UX & AI enthusiast.",
                style: GoogleFonts.firaCode(
                    color: Color(0xff4D5BCE), fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Chip(
                  backgroundColor: Color(0xff031420),
                  surfaceTintColor: Colors.transparent,
                  side: BorderSide(
                    color: Color(0xff4D5BCE),
                    width: 1.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.green,
                    maxRadius: 5,
                  ),
                  label: Text(
                    'Available For Freelance / Full-Time',
                    style: GoogleFonts.firaCode(
                      fontSize: 14,
                      color: Color(0xffE99287),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              Text(
                "// welcome to my portfolio",
                style: GoogleFonts.firaCode(
                    color: Color(0xff607B96), fontSize: 15),
              ),
              Text(
                "// you can also see it on my Github page",
                style: GoogleFonts.firaCode(
                    color: Color(0xff607B96), fontSize: 15),
              ),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.firaCode(fontSize: 14),
                  children: [
                    TextSpan(
                      text: "const ",
                      style: TextStyle(
                          color: Color(0xff4D5BCE), fontSize: 15), // 4D5BCE
                    ),
                    TextSpan(
                      text: "githubLink ",
                      style: TextStyle(
                          color: Color(0xff43D9AD), fontSize: 15), // 43D9AD
                    ),
                    TextSpan(
                      text: "= ",
                      style:
                          TextStyle(color: Colors.white, fontSize: 15), // White
                    ),
                    TextSpan(
                      text: "\"https://github.com/NiteshWarik23\"",
                      style: TextStyle(color: Color(0xffE99287), fontSize: 15),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => openGitHub(),
                    ),
                    TextSpan(
                      text: ";",
                      style:
                          TextStyle(color: Colors.white, fontSize: 14), // White
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ResumeButton(),
              ),
              //RippleEffect(),  flutter_bloc
              SizedBox(
                height: 500,
                child: GradientCircleEffect(),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              ModernMarquee(
                items: [
                  '🚀 Flutter Developer',
                  '🔥 Firebase Enthusiast',
                  '💼 Portfolio by Nitesh',
                ],
              ),
              ModernMarquee(
                isImage: true,
                height: 60,
                items: [
                  'https://img.icons8.com/color/48/flutter.png',
                  'https://img.icons8.com/color/48/firebase.png',
                  'https://img.icons8.com/color/48/dart.png',
                  'https://img.icons8.com/color/48/figma.png',
                  'https://img.icons8.com/?size=100&id=4VVL78edhbW9&format=png&color=000000'
                ],
              )


            ],
          ),
        ),
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
                  width: 10,
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.25,
                    child: Text(
                      "find me in:",
                      style: GoogleFonts.firaCode(
                          color: Color(0xff607B96), fontSize: 14),
                    )),
                verticalDividerWidget(context),
                socialAccountRedirectionWidget(context,
                    "https://x.com/Nitesh_Warik", 'assets/icons/X.svg'),
                verticalDividerWidget(context),
                socialAccountRedirectionWidget(
                    context,
                    "https://github.com/NiteshWarik23",
                    'assets/icons/facebook.svg'),
                verticalDividerWidget(context),
                socialAccountRedirectionWidget(
                    context,
                    "https://github.com/NiteshWarik23",
                    'assets/icons/github.svg'),
                verticalDividerWidget(context),
                socialAccountRedirectionWidget(
                    context, "", 'assets/icons/email.svg',
                    isEmail: true),
                verticalDividerWidget(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget socialAccountRedirectionWidget(
      BuildContext context, String redirectionUrl, String iconPath,
      {bool isEmail = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor:
            SystemMouseCursors.click, // 👈 This changes the cursor to a hand
        child: GestureDetector(
          onTap: () {
            isEmail ? openEmailClient() : openUrl(redirectionUrl);
          },
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.05,
            child: SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
              colorFilter:
                  const ColorFilter.mode(Color(0xff607B96), BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }

  Widget verticalDividerWidget(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height,
      width: MediaQuery.sizeOf(context).width * 0.001,
      color: Color(0xff607B96),
    );
  }

  void openUrl(String urlString) async {
    final String url = urlString;
    // "https://github.com/NiteshWarik23";
    // if (kIsWeb) {
    //   html.window.open(url, "_blank"); // Opens in a new tab for Flutter Web
    // } else {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  void openEmailClient() async {
    if (kIsWeb) {
      openUrl(
          "https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=new");
    } else {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'niteshwarik23@gmail.com',
        //query: 'subject=Support Needed&body=Hi, I need help with...', how
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
      } else {
        // S  a message another way to open the email client
        print("Could not launch email client.");
      }
    }
  }

  AppBar customAppBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff031420),
      foregroundColor: Color(0xff607B96),
      surfaceTintColor: Colors.transparent,
      toolbarHeight: MediaQuery.sizeOf(context).height * 0.07,
      flexibleSpace: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width:
                        300, //MediaQuery.sizeOf(context).width * 0.18, how to create a download resume button with functionality in flutter web or redirect it to drive link
                    child: Text(
                      "nitesh_kishor_warik",
                      style: GoogleFonts.firaCode(
                          color: Color(0xff607B96), fontSize: 14),
                    ),
                  ),
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
      ),
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

class GradientCircleEffect extends StatelessWidget {
  const GradientCircleEffect({super.key});
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
            Positioned(
                top: constraints.maxHeight * 0.04, // Move slightly lower
                right: constraints.maxWidth * 0.3,
                child: RippleEffect()),
            // Stack for Radial Gradients
            Positioned(
              top: constraints.maxHeight * 0.25, // Move slightly lower
              right: constraints.maxWidth * 0.25,
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    radius: 0.45,
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
              top: constraints.maxHeight *
                  0.1, // Move slightly up What issues are their in this code I'm using it in column and the column is in single child scroll view
              left: constraints.maxWidth * 0.3,
              right: constraints.maxHeight * 0.02,
              child: Container(
                width: 150,
                height: 150,
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
}

class AboutMeMobileView extends StatelessWidget {
  const AboutMeMobileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About Me'),
      ),
    );
  }
}

