import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResumeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        final url =
            //'https://drive.google.com/uc?export=download&id=1JK7-0N8hh4r6KWLQ3qtGTJgWixpCaWQ_';
        'assets/assets/Nitesh_Warik_Flutter.pdf'; // Relative URL in build/web
        html.AnchorElement anchorElement = html.AnchorElement(href: url)
          ..setAttribute("download", "Nitesh_Warik_Flutter.pdf")
          ..click();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff031420),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: Color(0xff4D5BCE),
            width: 1.0,
          ),
        ),
      ),
      icon: Icon(
        Icons.file_download_rounded,
        color: Color(0xffE99287),
      ),
      label: Text(
        "Download Resume",
        style: GoogleFonts.firaCode(
          color: Color(0xffE99287),
          fontSize: 16,
        ),
      ),
    );
  }
}
// i used the assets path but when deployed to github pages it does not work
// because the pdf is in build web in assets/assets/Nitesh_Warik_Flutter.pdf