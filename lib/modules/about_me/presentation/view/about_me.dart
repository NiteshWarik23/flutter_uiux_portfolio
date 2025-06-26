// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/about_me_sidebar.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/content_area_widget.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  String? _selectedItem;

  void _onItemSelected(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.038,
              child: Column(
                spacing: 8.0,
                children: [
                  sidebarIconWidget('assets/icons/professionalInfoIcon.svg'),
                  sidebarIconWidget('assets/icons/personalInfoIcon.svg'),
                  sidebarIconWidget('assets/icons/hobbiesIcon.svg'),
                ],
              ),
            ),
            VerticalDivider(
              color: Color(0xff607B96),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.16,
              child:
                  PersonalInfoAndContactWidget(onItemSelected: _onItemSelected),
            ),
            VerticalDivider(
              color: Color(0xff607B96),
            ),
            // Personla Info
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.38,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AboutMeSideBarHeaderWidget(
                    title: 'personal-info',
                    iconPath: '',
                  ),
                  Expanded(
                    child: RightContentWidget(selectedItem: _selectedItem),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.05,
            left: MediaQuery.sizeOf(context).width * 0.043,
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.001,
            color: Color(0xff607B96),
          ),
        )
      ],
    );
  }

  Widget sidebarIconWidget(String? assetPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        assetPath ?? 'assets/icons/X.svg',
        height: 24,
        width: 24,
        fit: BoxFit.contain,
        colorFilter: const ColorFilter.mode(Color(0xff607B96), BlendMode.srcIn),
      ),
    );
  }
}





// class SideBar extends StatelessWidget {
//   const SideBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff031420),
//       body: Row(
//         children: [
//           //Sidebar(), // Custom Sidebar
//           Expanded(
//             child: CodeEditorWidget(
//               codeLines: [
//                 'void main() {',
//                 '  print("Hello, world!");',
//                 '}',
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Sidebar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 250, // Sidebar width
//           color: const Color(0xff031420), // VS Code Dark Theme
//           child: Column(
//             children: [
//               // Sidebar Header
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 alignment: Alignment.centerLeft,
//                 color: const Color(0xff031420), // Slightly lighter
//                 child: const Text(
//                   "Explorer",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     SidebarSection(
//                       title: "Project Files",
//                       items: ["main.dart", "home.dart", "sidebar.dart"],
//                       iconPath: 'assets/icons/orangeFolder.svg',
//                     ),
//                     SidebarSection(
//                       title: "Components",
//                       items: ["button.dart", "card.dart", "input_field.dart"],
//                       iconPath: 'assets/icons/orangeFolder.svg',
//                     ),
//                     SidebarSection(
//                       title: "Utils",
//                       items: ["api.dart", "constants.dart"],
//                       iconPath: 'assets/icons/orangeFolder.svg',
//                     ),
//                     SidebarSection(
//                       title: "Assets",
//                       items: ["logo.png", "icons/"],
//                       iconPath: 'assets/icons/orangeFolder.svg',
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         VerticalDivider(
//           color: Color(0xff607B96),
//         )
//       ],
//     );
//   }
// }


