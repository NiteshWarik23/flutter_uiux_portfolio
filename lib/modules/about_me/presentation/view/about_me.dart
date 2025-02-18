import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.038,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/X.svg',
                height: 24,
                width: 24,
                fit: BoxFit.contain,
                colorFilter:
                    const ColorFilter.mode(Color(0xff607B96), BlendMode.srcIn),
              ),
            ],
          ),
        ),
        VerticalDivider(
          color: Color(0xff607B96),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.11,
        ),
        VerticalDivider(
          color: Color(0xff607B96),
        )
      ],
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031420),
      body: Row(
        children: [
          Sidebar(), // Custom Sidebar
          Expanded(
            child: Center(
              child: Text("Main Content Area", style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 250, // Sidebar width
          color: const Color(0xff031420), // VS Code Dark Theme
          child: Column(
            children: [
              // Sidebar Header
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                color: const Color(0xff031420), // Slightly lighter
                child: const Text(
                  "Explorer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SidebarSection(
                        title: "Project Files",
                        items: ["main.dart", "home.dart", "sidebar.dart"]),
                    SidebarSection(
                        title: "Components",
                        items: ["button.dart", "card.dart", "input_field.dart"]),
                    SidebarSection(
                        title: "Utils", items: ["api.dart", "constants.dart"]),
                    SidebarSection(title: "Assets", items: ["logo.png", "icons/"]),
                  ],
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

class SidebarSection extends StatelessWidget {
  final String title;
  final List<String> items;

  const SidebarSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      children: items
          .map((item) => ListTile(
                title: Text(item, style: const TextStyle(color: Colors.grey)),
                contentPadding: const EdgeInsets.only(left: 32),
                leading: const Icon(Icons.insert_drive_file,
                    color: Colors.grey, size: 18),
                onTap: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Opening $item")));
                },
              ))
          .toList(),
    );
  }
}
