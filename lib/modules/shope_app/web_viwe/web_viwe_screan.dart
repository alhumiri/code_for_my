
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShopeWebViwScren extends StatelessWidget {
final String url;
ShopeWebViwScren(this.url);
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
