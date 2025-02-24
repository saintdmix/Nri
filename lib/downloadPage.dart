import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaystackWeb extends StatefulWidget {
  const PaystackWeb({
    super.key,
  });

  @override
  State<PaystackWeb> createState() => _PaystackWebState();
}

class _PaystackWebState extends State<PaystackWeb> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
      ),
    )
    ..loadRequest(Uri.parse(
        'https://github.com/saintdmix/Nri/releases/latest/download/Nri.apk'));
  bool isLoading = true;
  // State variable to manage loading state
  double progress = 0; // Variable to store loading progress
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download Page')),
      body: WebViewWidget(controller: controller),
    );
  }
}
