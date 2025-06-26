import 'package:flutter/material.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/code_editor_widget.dart';

class RightContentWidget extends StatelessWidget {
  final String? selectedItem;

  RightContentWidget({required this.selectedItem});

  final Map<String, Widget> contentMap = {
    'info.dart': CodeEditorWidget(
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
    ),
    'Profile': Center(child: Text('Profile Content')),
    'Settings': Center(child: Text('Settings Content')),
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: selectedItem == null
          ? Center(child: Text("Select a menu item"))
          : contentMap[selectedItem] ?? Center(child: Text("No content")),
    );
  }
}
