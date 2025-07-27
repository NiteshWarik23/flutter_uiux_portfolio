import 'package:flutter/material.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/code_editor_widget.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/code_snippet_widget.dart';

class RightContentWidget extends StatelessWidget {
  final String? selectedItem;

  RightContentWidget({required this.selectedItem});

  final Map<String, Widget> contentMap = {
    'info.dart': CodeEditorWidget(
      codeLines: [
        '/**',
        '* About me',
        '* Hello Nitesh here from India,',
        '* I\'m a Bsc.IT graduate,',
        '* ',
        '* I\'ve worked as a professional Mobile App Developer',
        '* for 3 years at Atrina Technologies Pvt Ltd.(2022-2025)',
        '* I\'ve worked on various projects in different domains',
        '* like FMCG, FinTech, EdTech and Lending',
        '* using Flutter Framework.',
        '*',
        '* I\'m proficient in using BLoC, Provider, GetX',
        '* RxDart and Riverpod state management libraries.',
        '* I\'m also familiar with REST APIs Integrations,',
        '* Firebase, Firestore, and SQLite.',
        '* I\'m passionate about learning new technologies',
        '* and improving my skills.',
        '* I\'m always eager to take on new challenges',
        '* and contribute to the success of my team.',
        '*',
        '* I\'m looking forward to working with you',
        '* and helping you achieve your goals.',
        '*',
        '* Thank you for visiting my portfolio.',
        '*/',
      ],
    ),
    'uiux.dart': CodeEditorWidget(
      codeLines: [
        '/**',
        '* I\'m a UI/UX enthusiast with a passion for creating',
        '* intuitive and user-friendly interfaces.',
        '* ',
        '* I believe that good design is not just about',
        '* aesthetics, but also about functionality and usability.',
        '* ',
        '* I\'m always looking for ways to improve the user experience',
        '* and make it more enjoyable.',
        '* ',
        '* I\'m proeficient in using design tools like Figma,',
        '* Adobe XD, Rive and sketch.',
        '* ',
        '* I\'m also familiar with design principles',
        '* like color theory, typography and layout.',
        '* ',
        '* I\'m always eager to learn new design trends',
        '* and techniques to enhance my skills.',
        '* ',
        '* Thank you for visiting my portfolio.',
        '*/',
      ],
    ),
    'ai.dart' : CodeEditorWidget(
      codeLines: [
        '/**',
        '* I\'m a AI enthusiast',
        '* I\'m passionate about exploring the potential of AI',
        '* ',
        '* I believe that AI can revolutionize the way we interact with technology',
        '* and improve our lives in many ways.',
        '* ',
        '* I\'m always looking for ways to leverage AI',
        '* to create innovative solutions and enhance user experiences.',
        '* ',
        '* Thank you for visiting my portfolio.',
        '*/',
      ],
    ),
    'dsa.dart': CodeEditorWidget(
      codeLines: [
        '/**',
        '* About me where to make .github/workflows folder',
        '* Hello Nitesh here from India,',
        '* I\'m a Bsc.IT graduate,',
        '* ',
        '* I\'ve worked as a professional Mobile App Developer',
        '* for 3 years at Atrina Technologies Pvt Ltd.(2022-2025)',
        '* I\'ve worked on various projects in different domains',
        '* like FMCG, FinTech, EdTech and Lending',
        '* using Flutter Framework.',
        '*',
        '* I\'m proficient in using BLoC, Provider, GetX',
        '* RxDart and Riverpod state management libraries.',
        '* I\'m also familiar with REST APIs Integrations,',
        '* Firebase, Firestore, and SQLite.',
        '* I\'m passionate about learning new technologies',
        '* and improving my skills.',
        '* I\'m always eager to take on new challenges',
        '* and contribute to the success of my team.',
        '*',
        '* I\'m looking forward to working with you',
        '* and helping you achieve your goals.',
        '*',
        '* Thank you for visiting my portfolio.',
        '*/',
      ],
    ),
    'university.dart': CodeEditorWidget(
      codeLines: [
        '/**',
        '* Mumbai University',
        '* Bachelor of Science in Information Technology (BSc.IT)',
        '* Year of graduation: 2021',
        '* ',
      ],
    ),
    'Settings': Center(child: Text('Settings Content')),
  };
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: selectedItem == null
          ?  CodeEditorWidget(
      codeLines: [
        '/**',
        '* Welcome,',
        '* ',
        '* development lorem ipsum dolor sit amet',
        '* consectetur adipiscing elit, sed do eiusmod',
        '* tempor incididunt ut labore et dolore',
        '* magna aliqua. Ut enim ad minim veniam',
        '* quis nostrud exercitation ullamco laboris',
        '* nisi ut aliquip ex ea commodo consequat.',
        '* Duis aute irure dolor in reprehenderit in',
        '*',
        '* Duis aute irure dolor in reprehenderit in',
        '* voluptate velit esse cillum dolore eu fugiat ',
        '* nulla pariatur. Excepteur sint occaecat ',
        '* officia deserunt mollit anim id est laborum.',
        '*/',
      ],
    )
          //Center(child: Text("Select a menu item", style: TextStyle(color: Colors.white)))
          : contentMap[selectedItem] ?? Center(child: Text("No content")),
    );
  }
}
