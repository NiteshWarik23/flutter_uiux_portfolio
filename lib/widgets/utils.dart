import 'dart:ui' as ui;
import 'dart:html' as html;

void registerModernMarquee(List<String> items, {bool isImage = false}) {
  final id = isImage ? 'modern-marquee-logos' : 'modern-marquee-text';

  // Build content
  final content = items.map((item) {
    return isImage
        ? '<img src="$item" height="30" style="margin-right: 40px;" />'
        : '<span style="margin-right: 60px;">$item</span>';
  }).join('');

  // Register HTML + CSS 
  ui.platformViewRegistry.registerViewFactory(
    id,
    (int viewId) {
      final element = html.DivElement()..setInnerHtml('''
          <style>
            .marquee-container {
              width: 100%;
              overflow: hidden;
              background: transparent;
            }
            .marquee-content {
              display: inline-block;
              white-space: nowrap;
              padding-left: 100%;
              animation: marquee 30s linear infinite;
              font-size: 20px;
              color: #E99287;
              vertical-align: middle;
            }
            @keyframes marquee {
              0% { transform: translateX(0%); }
              100% { transform: translateX(-100%); }
            }
          </style>
          <div class="marquee-container">
            <div class="marquee-content">
              $content
            </div>
          </div>
        ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
      return element;
    },
  );
}
