
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadPage extends StatelessWidget {
  final String apkUrl =
      "https://dl.dropboxusercontent.com/scl/fi/9n9rs75a0xokj68vn10e2/Nri.apk?rlkey=5vxwgv278c0eq46xoeogz0873&st=m025rbs9&dl=1";

  Future<void> _downloadApk() async {
    Uri url = Uri.parse(apkUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Opens in Chrome/Safari
      );
    } else {
      throw "Could not launch $apkUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Download APK")),
      body: Center(
        child: ElevatedButton(
          onPressed: _downloadApk,
          child: Text("Download APK"),
        ),
      ),
    );
  }
}
