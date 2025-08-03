import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsSidebarSection extends StatefulWidget {
  final String title;
  final List<String> items;
  final String iconPath;
  final Function(List<String>) onItemSelected;

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
      initiallyExpanded: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.iconPath,
              height: 8,
              width: 8,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.firaCode(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,

      // ✅ List of CheckboxListTile items
      children: widget.items.map((item) {
        return CheckboxListTile.adaptive(
          controlAffinity: ListTileControlAffinity.leading, // ✅ Key line!
          title: Row(
            spacing: 4,
            children: [
              SvgPicture.asset(
                'assets/icons/Flutter.svg',
                height: 22,
                width: 22,
                fit: BoxFit.contain,
              ),
              Expanded(
                child: Text(
                  item,
                  semanticsLabel: item,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.firaCode(
                    color: const Color(0xff607B96),
                    fontSize: 14,
                  ),
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
                print('Selected items: $selectedItems');
              } else {
                selectedItems.remove(item);
                print('After Removal of items: $selectedItems');
              }
              widget.onItemSelected(selectedItems); // Optional callback
            });
          },
        );
      }).toList(),
    );
  }
}
