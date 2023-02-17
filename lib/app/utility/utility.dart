import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

makePhoneCall({required String phoneNumber}) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

openBrowser({required url}) async {
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

launchInWebView({required url}) async {
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.inAppWebView,
    webViewConfiguration: const WebViewConfiguration(
        headers: <String, String>{"Accept": 'application/json'}),
  )) {
    throw 'Could not launch $url';
  }
}

dynamic stringToInt({required data}) async {
  var con = int.parse(data);
  debugPrint("convert string to int is: $con");
  return con;
}
