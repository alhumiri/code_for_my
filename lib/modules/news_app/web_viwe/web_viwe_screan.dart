import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViwScren extends StatelessWidget {
final String url;
  WebViwScren(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: url,
        ),
      );
  }
}
