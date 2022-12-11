import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'http://tv.globalnet.ge/${widget.deviceId}',
        ),
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  final String deviceId;

  const WebViewPage({
    required this.deviceId,
    super.key,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}
