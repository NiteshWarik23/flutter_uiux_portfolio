
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color.fromARGB(255, 2, 29, 50),
      appBar: AppBar(
        backgroundColor: Color(0xff031420),
        toolbarHeight: 40.0,
        // bottom: const PreferredSize(
        //   preferredSize:
        //       Size.fromHeight(0.2), // Adjust the height of the border
        //   child: Divider(
        //     color: Colors.grey, // Customize the border color
        //   ),
        // ),
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.15,
                child: Text(
                  "nitesh_kishor_warik",
                  style: TextStyle(color: Color(0xff607B96), fontSize: 16),
                )),
            verticalDividerWidget(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "_hello",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.05,
                  height: AppBar().preferredSize.height * 0.04,
                  color: Color(0xffFEA55F),
                )
              ],
            ),
            verticalDividerWidget(context),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.06,
              //height: MediaQuery.sizeOf(context).height * 0.2,
              child: Text(
                "_about-me",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff607B96), fontSize: 16),
              ),
            ),
            verticalDividerWidget(context),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.05,
              //height: MediaQuery.sizeOf(context).height * 0.2,
              child: Text(
                "_projects",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff607B96), fontSize: 16),
              ),
            ),
            verticalDividerWidget(context),
            Spacer(),
            verticalDividerWidget(context),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.1,
              //height: MediaQuery.sizeOf(context).height * 0.2,
              child: Text(
                "_contact-me",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff607B96), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
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
                                    style: TextStyle(
                                        color: Color(0xffE99287)), // E99287
                                  ),
                                  TextSpan(
                                    text: ";",
                                    style:
                                        TextStyle(color: Colors.white), // White
                                  ),
                                ],
                              ),
                            ),
                            //   ],
                            // ),
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
