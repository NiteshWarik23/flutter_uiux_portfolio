import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsSidebarSection extends StatefulWidget {
  final String title;
  final List<String> items;
  final String iconPath;
  final Function(String) onItemSelected;

  const ProjectsSidebarSection({
    super.key,
    required this.title,
    required this.items,
    required this.iconPath,
    required this.onItemSelected,
  });

  @override
  State<ProjectsSidebarSection> createState() => _ProjectsSidebarSectionState();
}

class _ProjectsSidebarSectionState extends State<ProjectsSidebarSection> {
  bool isExpanded = false;

  // ✅ Track selected items
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (bool expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
      // leading: Icon(
      //   isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
      //   color: const Color(0xff607B96),
      // ),
      showTrailingIcon: false,
      title: Row(
        children: [
          SvgPicture.asset(
            widget.iconPath,
            height: 8,
            width: 8,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: GoogleFonts.firaCode(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,

      // ✅ List of CheckboxListTile items
      children: widget.items.map((item) {
        return CheckboxListTile.adaptive(
          title: Row(
            spacing: 4,
            children: [
               SvgPicture.asset(
              'assets/icons/Flutter.svg',
                height: 22,
                width: 22,
                fit: BoxFit.contain,
              ),
              Text(
                item,
                style: GoogleFonts.firaCode(
                  color: const Color(0xff607B96),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          contentPadding: const EdgeInsets.only(left: 32),
          value: selectedItems.contains(item), // ✅ is it selected?
          onChanged: (bool? selected) {
            setState(() {
              if (selected == true) {
                selectedItems.add(item);
              } else {
                selectedItems.remove(item);
              }
              widget.onItemSelected(item); // Optional callback
            });
          },
        );
      }).toList(),
    );
  }
}
