import 'package:flutter/material.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/about_me_sidebar.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/code_editor_widget.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/content_area_widget.dart';
import 'package:my_portfolio/modules/projects/presentation/widgets/projects_section.dart';
import 'package:my_portfolio/modules/projects/presentation/widgets/projects_sidebar.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<String>? _selectedItem;

  void _onItemSelected(List<String> selectedItems) {
    setState(() {
      _selectedItem = selectedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Stack(
      children: [
        Row(
          children: [
            Sidebar(
              onItemSelected: _onItemSelected,
            ), // Custom Sidebar
            SizedBox(
              //color: Colors.white,
              width: MediaQuery.sizeOf(context).width * 0.75,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: AboutMeSideBarHeaderWidget(
                      title: 'my_projects',
                      iconPath: '',
                    ),
                  ),
                  Expanded(
                    // flex: 4,
                    // fit: FlexFit.loose,
                    child: ProjectsAreaWidget(selectedItem: _selectedItem),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.05,
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
}

class Sidebar extends StatelessWidget {
  final Function(List<String>) onItemSelected;

  const Sidebar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.158, // Sidebar width
          //color: const Color(0xff031420), // VS Code Dark Theme
          child: Column(
            children: [
              Expanded(
                child: ProjectsSidebarSection(
                  title: 'Projects',
                  items: ['Flutter','Dart', 'UIUX','FlutterExpert'],
                  iconPath: 'assets/icons/dropdownArrow.svg',
                  onItemSelected: onItemSelected,
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(
          color: Color(0xff607B96),
        )
      ],
    );
  }
}
