import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeSnippetCard extends StatelessWidget {
  const CodeSnippetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * 0.03,
      ),
      child: Container(
        color: Color(0xff031420),
        margin: const EdgeInsets.all(16),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header (User Info)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'nitesh_kishor_warik',
                        style: GoogleFonts.firaCode(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Created 5 months ago',
                        style: GoogleFonts.firaCode(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.info_outline, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    'details',
                    style: GoogleFonts.firaCode(color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.star, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    '3 stars',
                    style: GoogleFonts.firaCode(color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Code Block
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.63,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xff031420),
                border: Border.all(
                  color: Color(0xff607B96),
                  width: MediaQuery.sizeOf(context).height * 0.001,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: 
              DartHighlightSnippet()
              //ManualCodeHighlighter(),
            ),
          ],
        ),
      ),
    );
  }
}

class ManualCodeHighlighter extends StatelessWidget {
  const ManualCodeHighlighter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff031420), // Dark code background
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      child: RichText(
        text: TextSpan(
          style:  GoogleFonts.firaCode(
            fontSize: 13,
            height: 1.8, // 👈 Line spacing (1.5 to 2.0 is typical)

            color: Colors.white,
          ),
          children: [
            _keyword('function'),
            _space(),
            _identifier('initializeModelChunk'),
            _symbol('<'),
            _type('T'),
            _symbol('>('),
            _identifier('chunk'),
            _symbol(':'),
            _type(' ResolvedModelChunk'),
            _symbol('):'),
            _type(' T'),
            _space(),
            _symbol('{'),
            _newline(),
            _indent(1),
            _keyword('const'),
            _space(),
            _identifier('value'),
            _symbol(':'),
            _type(' T'),
            _space(),
            _symbol('='),
            _space(),
            _identifier('parseModel'),
            _symbol('('),
            _identifier('chunk'),
            _symbol('._'),
            _identifier('response'),
            _symbol(','),
            _space(),
            _identifier('chunk'),
            _symbol('._'),
            _identifier('value'),
            _symbol(');'),
            _newline(),
            _indent(1),
            _keyword('const'),
            _space(),
            _identifier('initializedChunk'),
            _symbol(':'),
            _type(' InitializedChunk'),
            _symbol('<'),
            _type('T'),
            _symbol('> ='),
            _space(),
            _symbol('('),
            _identifier('chunk'),
            _symbol(': any'),
            _symbol(');'),
            _newline(),
            _indent(1),
            _identifier('initializedChunk'),
            _symbol('._status = '),
            _constant('INITIALIZED'),
            _symbol(';'),
            _newline(),
            _indent(1),
            _identifier('initializedChunk'),
            _symbol('._value = '),
            _identifier('value'),
            _symbol(';'),
            _newline(),
            _indent(1),
            _keyword('return'),
            _space(),
            _identifier('value'),
            _symbol(';'),
            _newline(),
            _symbol('}'),
          ],
        ),
      ),
    );
  }

  // Utility functions for styling:
  TextSpan _keyword(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.blue));

  TextSpan _type(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.cyanAccent));

  TextSpan _identifier(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.white));

  TextSpan _constant(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.orange));

  TextSpan _symbol(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.grey));

  TextSpan _space() => const TextSpan(text: ' ');
  TextSpan _newline() => const TextSpan(text: '\n');
  TextSpan _indent(int level) => TextSpan(text: '  ' * level);
}





class DartHighlightSnippet extends StatelessWidget {
  const DartHighlightSnippet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff031420),  // Dark background like a code editor
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(

        scrollDirection: Axis.vertical,
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              height: 1.6,
              color: Colors.white,
            ),
            children: [
              _keyword('Future'), _symbol('<'), _className('AboutResponse'), _symbol('> '),
              _function('fetchAboutNitesh'), _symbol('({'), _type('int'), _space(), _variable('retries'), _symbol(' = 3}) '),
              _keyword('async'), _space(), _symbol('{'), _newline(),

              _indent(1), _keyword('for'), _space(), _symbol('('), _type('int'), _space(), _variable('attempt'), _space(),
              _symbol('= 1; '), _variable('attempt'), _space(), _symbol('<= '), _variable('retries'), _symbol('; '),
              _variable('attempt++'), _symbol(') '), _symbol('{'), _newline(),

              _indent(2), _keyword('try'), _space(), _symbol('{'), _newline(),

              _indent(3), _comment('// Pretend this is your personal API 🙂'), _newline(),
              _indent(3), _keyword('final'), _space(), _variable('response'), _space(), _symbol('= '),
              _keyword('await'), _space(), _variable('http'), _symbol('.'), _function('get'),
              _symbol('('), _className('Uri'), _symbol('.'), _function('parse'),
              _symbol('('), _string('"https://nitesh.dev/api/about"'), _symbol('));'), _newline(),

              _indent(3), _keyword('if'), _space(), _symbol('('), _variable('response.statusCode'), _space(),
              _symbol('== 200)'), _space(), _symbol('{'), _newline(),

              _indent(4), _keyword('return'), _space(), _className('AboutResponse'), _symbol('.success('),
              _function('jsonDecode'), _symbol('('), _variable('response.body'), _symbol('));'), _newline(),

              _indent(3), _symbol('}'), _space(), _keyword('else'), _space(), _symbol('{'), _newline(),
              _indent(4), _keyword('throw'), _space(),
              _className('Exception'), _symbol('("Unexpected status: \$'),
              _variable('response.statusCode'), _symbol('");'), _newline(),
              _indent(3), _symbol('}'), _newline(),

              _indent(2), _symbol('}'), _space(), _keyword('catch'), _symbol(' (e) '), _symbol('{'), _newline(),

              _indent(3), _keyword('if'), _space(), _symbol('('), _variable('attempt == retries'), _symbol(') '), _symbol('{'), _newline(),
              _indent(4), _keyword('return'), _space(), _className('AboutResponse'), _symbol('.error('),
              _string('"Couldn\'t load Nitesh\'s story: \$e"'), _symbol(');'), _newline(),
              _indent(3), _symbol('}'), _newline(),

              _indent(3), _keyword('await'), _space(), _className('Future'), _symbol('.delayed('),
              _className('Duration'), _symbol('(seconds: 2));'), _newline(),

              _indent(2), _symbol('}'), _newline(),

              _indent(1), _symbol('}'), _newline(),

              _indent(1), _keyword('return'), _space(), _className('AboutResponse'), _symbol('.error('),
              _string('"Nitesh\'s journey is still loading..."'), _symbol(');'), _newline(),

              _symbol('}'),
            ],
          ),
        ),
      ),
    );
  }

  // Highlight helpers
  static TextSpan _keyword(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Color(0xff4D5BCE),fontSize: 14));
  static TextSpan _type(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.orangeAccent,fontSize: 14));
  static TextSpan _className(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Color(0xff43D9AD), fontSize: 14));
  static TextSpan _variable(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Color(0xffE99287), fontSize: 14));
  static TextSpan _function(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.lightBlueAccent, fontSize: 14));
  static TextSpan _string(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.greenAccent, fontSize: 14));
  static TextSpan _comment(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 14));
  static TextSpan _symbol(String text) =>
      TextSpan(text: text, style: const TextStyle(color: Colors.white, fontSize: 14));
  static TextSpan _space() => const TextSpan(text: ' ');
  static TextSpan _newline() => const TextSpan(text: '\n');
  static TextSpan _indent(int level) => TextSpan(text: '  ' * level);
}
