// ignore: undefined_prefixed_name
import 'dart:ui_web' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'dart:html' as html;
import 'package:web/web.dart' as web; // Add


class GoogleFormEmbed extends StatelessWidget {
  final String formUrl =
      'https://docs.google.com/forms/d/e/1FAIpQLSdn7v4YMj9GNn86EtQUL5gLFetxhwDBZxgVlHuSum5oEI-opA/viewform?embedded=true';

  @override
  Widget build(BuildContext context) {
    // Register view factory
    // Unique viewType
    const viewType = 'google-form-iframe';
     if (kIsWeb) {
      // Register the view factory only on web
      ui.platformViewRegistry.registerViewFactory(
        'google-form-iframe',
        (int viewId) {
          // Create an HTMLIFrameElement using the 'web' package
        final web.HTMLIFrameElement iframe = web.HTMLIFrameElement();

        // Set properties directly on the iframe element using 'web' package types
        iframe.src = formUrl;
        iframe.style.border = 'none'; // No border for a cleaner embed
        iframe.width = '100%'; // Full width of its parent
        iframe.height = '600'; // Fixed height, adjust as needed

        // You can add more attributes or event listeners here if necessary
        // Example: iframe.allowFullscreen = true;
        // Example: iframe.onLoad.listen((event) => print('Iframe loaded!'));

        return iframe; // Return the HTML iframe element
        }
        // => web.i IFrameElement()
        //   ..src = formUrl
        //   ..style.border = 'none'
        //   ..width = '100%'
        //   ..height = '600',
      );
    }

    return const HtmlElementView(viewType: viewType);
  }
}
