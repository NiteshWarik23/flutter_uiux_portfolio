import 'package:flutter/material.dart';
// import 'dart:html' as html;
// import 'dart:ui' as ui;

import 'package:my_portfolio/widgets/utils.dart';

class ModernMarquee extends StatelessWidget {
  final List<String> items;
  final bool isImage;
  final double height;

  ModernMarquee({super.key, 
    required this.items,
    this.isImage = false,
    this.height = 50,
  }) {
    // Register custom HTML view
    registerModernMarquee(items, isImage: isImage);
  }

  @override
  Widget build(BuildContext context) {
    final viewId = isImage ? 'modern-marquee-logos' : 'modern-marquee-text';
    return SizedBox(
      height: height,
      width: double.infinity,
      child: HtmlElementView(viewType: viewId),
    );
  }
}
