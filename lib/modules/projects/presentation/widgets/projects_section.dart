import 'package:flutter/material.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/code_editor_widget.dart';
import 'package:my_portfolio/modules/about_me/presentation/widgets/code_snippet_widget.dart';
import 'package:my_portfolio/modules/projects/presentation/widgets/projects_card.dart';

class ProjectsAreaWidget extends StatelessWidget {
  final List<String>? selectedItem;

  ProjectsAreaWidget({super.key, required this.selectedItem});

  final Map<String, List<Widget>> contentMap = {
    'Flutter': [
      ProjectsCard(
        projectName: 'Kids Learning App',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage1.png',
        onViewProject: () {},
      ),
      ProjectsCard(
        projectName: 'Pet Care Wellness App',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage1.png',
        onViewProject: () {},
      ),
      ProjectsCard(
        projectName: 'Nursing Service App',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage1.png',
        onViewProject: () {},
      ),
    ],
    'Dart': [
      ProjectsCard(
        projectName: 'Medicine Reminder App',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage2.png',
        onViewProject: () {},
      ),
      ProjectsCard(
        projectName: 'Medicine Inventory Tracker App',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage2.png',
        onViewProject: () {},
      ),
      ProjectsCard(
        projectName: 'Language Vocabulary App',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage2.png',
        onViewProject: () {},
      ),
    ],
    'UIUX': [
      ProjectsCard(
        projectName: 'Youtube AI Thumbnail Generator',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage3.png',
        onViewProject: () {},
      ),
      ProjectsCard(
        projectName: 'Keep Me Hydrated App',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage3.png',
        onViewProject: () {},
      ),
      ProjectsCard(
        projectName: 'Veggies Delivery App',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage3.png',
        onViewProject: () {},
      ),
    ],
    'FlutterExpert': [
      ProjectsCard(
        projectName: 'FlutterExpert',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage1.png',
        onViewProject: () {},
      ),
      ProjectsCard(
        projectName: 'FlutterExpert',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage1.png',
        onViewProject: () {},
      ),
      ProjectsCard(
        projectName: 'FlutterExpert',
        projectDescription:
            'Duis aute irure dolor in velit esse cillum dolore.',
        projectImagePath: 'assets/images/ProjectImage1.png',
        onViewProject: () {},
      ),
    ],
  };
  // Combine all widgets from selected keys
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: buildContent(selectedItem ?? [], context)
        // Used for Widget in content map
        // selectedItem == null || selectedItem!.isEmpty
        //     ? CodeEditorWidget(
        //         codeLines: [
        //           '/**',
        //           '* About me',
        //           '* I have 5 years of еxperience in web',
        //           '* development lorem ipsum dolor sit amet',
        //           '* consectetur adipiscing elit, sed do eiusmod',
        //           '* tempor incididunt ut labore et dolore',
        //           '* magna aliqua. Ut enim ad minim veniam',
        //           '* quis nostrud exercitation ullamco laboris',
        //           '* nisi ut aliquip ex ea commodo consequat.',
        //           '* Duis aute irure dolor in reprehenderit in',
        //           '*',
        //           '* Duis aute irure dolor in reprehenderit in',
        //           '* voluptate velit esse cillum dolore eu fugiat ',
        //           '* nulla pariatur. Excepteur sint occaecat ',
        //           '* officia deserunt mollit anim id est laborum.',
        //           '*/',
        //         ],
        //       )
        //     : SingleChildScrollView(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: selectedItem!
        //               .where((item) => contentMap.containsKey(item))
        //               .map((item) => Padding(
        //                     padding: const EdgeInsets.only(bottom: 16),
        //                     child: contentMap[item]!,
        //                   ))
        //               .toList(),
        //         ),
        //       ),
        //contentMap[selectedItem] ?? Center(child: Text("No content")),
        );
  }

  Widget buildContent(List<String> selectedItems, BuildContext context) {
    // Combine all widgets from selected keys
    final widgets = selectedItems
        .expand((key) => contentMap[key] as List<Widget> ?? <Widget>[])
        .toList();

    return widgets.isEmpty
        ? CodeEditorWidget(
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
        : LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1130 ? 3 : 1;
              print('Maxwidth ${constraints.maxWidth}');
              return
                  // ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   padding: const EdgeInsets.all(16),
                  //   children: widgets,
                  // );
                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 40,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: widgets.length,
                      itemBuilder: (context, index) => widgets[index]
                      );
            },
          );
  }
}
