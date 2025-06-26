import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoAndContactWidget extends StatelessWidget {
  final Function(String) onItemSelected;
  const PersonalInfoAndContactWidget({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10,
      children: [
        // Personla Info
        AboutMeSideBarHeaderWidget(
          title: 'personal-info',
          iconPath: 'assets/icons/dropdownArrow.svg',
        ),
        // Personal Info Details
        Expanded(
          child: ListView(
            children: [
              SidebarSection(
                  title: "bio",
                  items: ["info.dart", "home.dart", "sidebar.dart"],
                  iconPath: 'assets/icons/orangeFolder.svg',
                  onItemSelected: onItemSelected),
              SidebarSection(
                  title: "interests",
                  items: ["button.dart", "card.dart", "input_field.dart"],
                  iconPath: 'assets/icons/greenFolder.svg',
                  onItemSelected: onItemSelected),
              SidebarSection(
                  title: "education",
                  items: ["high-school", "university"],
                  iconPath: 'assets/icons/purpleFolder.svg',
                  onItemSelected: onItemSelected),
              // Contacts Info
              AboutMeSideBarHeaderWidget(
                title: 'contacts',
                iconPath: 'assets/icons/dropdownArrow.svg',
              ),
              SidebarSection(
                  title: "user@gmail.com",
                  items: [],
                  iconPath: 'assets/icons/greenFolder.svg',
                  onItemSelected: onItemSelected),
              // SidebarSection(
              //   title: "+91 9004517482",
              //   items: ["high-school", "university"],
              //   iconPath: 'assets/icons/purpleFolder.svg',
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class SidebarSection extends StatefulWidget {
  final String title;
  final List<String> items;
  final String iconPath;
  final Function(String) onItemSelected;

  const SidebarSection({
    Key? key,
    required this.title,
    required this.items,
    required this.iconPath,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<SidebarSection> createState() => _SidebarSectionState();
}

class _SidebarSectionState extends State<SidebarSection> {
  bool isExpanded = false;
  //List<String> items = ['Bio', 'Interest', 'Edcation', 'Contacts'];

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (bool expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
      leading: Icon(
        isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
        color: Color(0xff607B96),
      ),
      showTrailingIcon: false,
      title: Row(
        spacing: 8,
        children: [
          SvgPicture.asset(
            widget.iconPath,
            height: 14,
            width: 14,
            fit: BoxFit.contain,
            // colorFilter: const ColorFilter.mode(
            //     Color(0xff607B96), BlendMode.srcIn),
          ),
          Text(
            widget.title,
            style: GoogleFonts.firaCode(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      children: widget.items
          .map((item) => ListTile(
                title: Text(
                  item,
                  style: GoogleFonts.firaCode(
                      color: Color(0xff607B96), fontSize: 14),
                ),
                contentPadding: const EdgeInsets.only(left: 32),
                leading: const Icon(Icons.folder, color: Colors.grey, size: 18),
                onTap: () => widget.onItemSelected(item),
                // {
                //   setState(() {
                //     _selectedItem = item;
                //   });
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text("Opening $item")));
                // },
              ))
          .toList(),
    );
  }
}

class AboutMeSideBarHeaderWidget extends StatelessWidget {
  final String title;
  final String iconPath;

  const AboutMeSideBarHeaderWidget({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 4.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 8,
        children: [
          iconPath.isEmpty
              ? const SizedBox.shrink()
              : SvgPicture.asset(
                  iconPath,
                  height: 8,
                  width: 8,
                  fit: BoxFit.contain,
                  // colorFilter: const ColorFilter.mode(
                  //     Color(0xff607B96), BlendMode.srcIn),
                ),
          Text(
            title,
            style: GoogleFonts.firaCode(color: Color(0xff607B96), fontSize: 14),
          ),
          iconPath.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Icon(
                    Icons.close,
                    color: Color(0xff607B96),
                    size: 15,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
