import 'package:flutter/material.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/code_editor_widget.dart';
import 'package:my_portfolio/modules/projects/presentation/widgets/projects_sidebar.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String? _selectedItem;

  void _onItemSelected(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031420),
      body: Row(
        children: [
          Sidebar(
            onItemSelected: _onItemSelected,
          ), // Custom Sidebar
          Expanded(
            child: CodeEditorWidget(
              codeLines: [
                'void main() {',
                '  print("Hello, world!");',
                '}',
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  final Function(String) onItemSelected;

  const Sidebar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 250, // Sidebar width
          color: const Color(0xff031420), // VS Code Dark Theme
          child: Column(
            children: [
              Expanded(
                child: ProjectsSidebarSection(
                  title: 'Projects',
                  items: ['Flutter'],
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
