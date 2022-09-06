import 'dart:io';

import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/vendor_feed.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveStreaming extends StatefulWidget {
  const LiveStreaming({Key key}) : super(key: key);

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming> {
  
  WebViewController _controller;
  
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(
        title: "PRODUCT PREVIEW",
      ),
      body: Center(
        child: WebView(
          initialUrl: 'https://katale.net/livestreams',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
