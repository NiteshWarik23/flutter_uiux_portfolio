// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsCard extends StatelessWidget {
  final String projectName;
  final String projectDescription;
  final String projectImagePath;
  final VoidCallback onViewProject;

  const ProjectsCard({
    super.key,
    required this.projectName,
    required this.projectDescription,
    required this.projectImagePath,
    required this.onViewProject,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Name
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  bottom: 10.0,
                  top: 5.0,
                ),
                child: Text(
                  projectName,
                  style: GoogleFonts.firaCode(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff031420),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color(0xff607B96),
                    width: 1,
                  ),
                ),
                height: MediaQuery.sizeOf(context).height * 0.35,
                width: MediaQuery.sizeOf(context).width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Image
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.16,
                        width: double.infinity,
                        child: Image.asset(
                          projectImagePath,
                          fit: BoxFit.fitWidth,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    //Project Description i also want logos in marquee in flutter web
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 8.0,
                      ),
                      child: Text(
                        projectDescription,
                        style: GoogleFonts.firaCode(
                            color: Colors.white, fontSize: 14),
                      ),
                    ),
                    //Project Tags
                    //Project Date
                    //View Project Button with Tech Stack Logo
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff1C2B3A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: onViewProject,
                            child: Text(
                              'View Project',
                              style: GoogleFonts.firaCode(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Color(0xffA0BDE1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/FlutterDarkLogo.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // Positioned(
        //   top: 60,
        //   right: 30,
        //   child: Container(
        //     width: 35,
        //     height: 35,
        //     decoration: BoxDecoration(
        //       color: Color(0xffA0BDE1),
        //       borderRadius: BorderRadius.circular(6),
        //     ),
        //     child: SvgPicture.asset(
        //       'assets/icons/FlutterDarkLogo.svg',
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
