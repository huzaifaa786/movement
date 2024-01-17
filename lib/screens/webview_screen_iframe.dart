import 'package:academy_app/widgets/app_bar_two.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreenIframe extends StatefulWidget {
  static const routeName = '/webview-iframe';
  
  final String? url;

  const WebViewScreenIframe({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewScreenIframe> createState() => _WebViewScreenIframeState();
}

class _WebViewScreenIframeState extends State<WebViewScreenIframe> {
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();

  late final WebViewController _controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.dataFromString('''<html><body><iframe style="height: 100%;width:100%" src="${widget.url}" allowfullscreen></iframe></body></html>''',
            mimeType: 'text/html'),
      );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBarTwo(),
      body: Stack(
        children: [
          WebViewWidget(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}
