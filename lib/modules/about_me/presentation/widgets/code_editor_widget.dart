import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeEditorWidget extends StatelessWidget {
  final List<String> codeLines;

  CodeEditorWidget({
    required this.codeLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color(0xFF1E1E1E), // dark background like a code editor
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: codeLines.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  '${index + 1}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.firaCode(
                    color: Color(0xff607B96),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SelectableText(
                  codeLines[index],
                  style: GoogleFonts.firaCode(
                    color: Color(0xff607B96),
                    fontSize: 14,
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
