import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/code_snippet_widget.dart';
import 'package:my_portfolio/modules/contact_me/view/widgets/conatct_me_code_snippet.dart';

class ContactMeForm extends StatefulWidget {
  const ContactMeForm({super.key});
  @override
  State<ContactMeForm> createState() => _ContactMeFormState();
}

class _ContactMeFormState extends State<ContactMeForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.05,
          height: MediaQuery.sizeOf(context).height,
        ),
        // Contact Me Form
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Text(
                  '_name:',
                  style: GoogleFonts.firaCode(
                    color: Color(0xff607B96),
                    fontSize: 15,
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  style: GoogleFonts.firaCode(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    //labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xff607B96)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xff607B96)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xff607B96)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                Text(
                  '_email:',
                  style: GoogleFonts.firaCode(
                    color: Color(0xff607B96),
                    fontSize: 15,
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  style: GoogleFonts.firaCode(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    // labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xff607B96)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xff607B96)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xff607B96)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                Text(
                  '_message:',
                  style: GoogleFonts.firaCode(
                    color: Color(0xff607B96),
                    fontSize: 15,
                  ),
                ),
                TextFormField(
                  controller: messageController,
                  style: GoogleFonts.firaCode(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    //labelText: 'Message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xff607B96)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xff607B96)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xff607B96)),
                    ),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1C2B3A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'submit-message',
                      style: GoogleFonts.firaCode(
                          color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Code Snippet Widget
        Expanded(child: Center(child: CodeSnippetWidget())
            //ConatctMeCodeSnippet(),
            ),
      ],
    );
  }
}

class CodeSnippetWidget extends StatelessWidget {
  const CodeSnippetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          _code,
          style: GoogleFonts.firaCode(
            fontSize: 14,
            color: Colors.greenAccent.shade100,
          ),
        ),
      ),
    );
  }

  static const String _code = '''
const button = document.querySelector('#sendBtn');

const message = {
  name: "Jonathan Davis",
  email: "",
  message: "",
  date: "Thu 21 Apr"
};

button.addEventListener('click', () => {
  form.send(message);
});
''';
}
