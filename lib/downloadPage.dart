import 'package:flutter/material.dart';

import 'package:nriweb/constants/constStyles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaystackWeb extends StatefulWidget {
  const PaystackWeb({
    super.key,
  });

  @override
  State<PaystackWeb> createState() => _PaystackWebState();
}

class _PaystackWebState extends State<PaystackWeb> {
  bool isLoading = true;
  // State variable to manage loading state
  double progress = 0; // Variable to store loading progress
  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          "https://github.com/saintdmix/Nri/releases/latest/download/Nri.apk"))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progressValue) {
            // Update loading progress only when it changes significantly
            double newProgress = progressValue / 100;
            if ((newProgress - progress).abs() >= 0.01) {
              // Only update for significant changes
              progress = newProgress;
            }
          },
          onPageFinished: (url) {
            // Perform any navigation or action after the page loads
            // Navigator.of(context).push(MaterialPageRoute(builder: (_) => VerifyPage()));
          },
        ),
      );
    return Scaffold(
      appBar: AppBar(
          title: const Text('Download Page',
              style: ConstStyles.SofiaProBold18Black)),
      body: Center(child: Text("Be patient while download begin...")),
    );
  }

  void processPayments(List<String> sellerIds) {
    for (var sellerId in sellerIds) {
      // Call your payment method for each sellerId
      sendPaymentToSeller(sellerId);
    }
  }

  void sendPaymentToSeller(String sellerId) {
    // Your payment logic here
  }
}
