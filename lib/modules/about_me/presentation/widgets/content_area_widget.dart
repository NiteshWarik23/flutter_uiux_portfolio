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
    'home.dart': CodeSnippetCard(),
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
        '* About me',
        '* I have 5 years of еxperience in web',
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
