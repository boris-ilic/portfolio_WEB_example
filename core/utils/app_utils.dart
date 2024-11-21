import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dio/dio.dart';

class AppUtils {
  static final Dio _dio = Dio();

  static void openLinkInNewTab(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> downloadAssetFile() async {
    try {
      final ByteData data = await rootBundle.load("assets/pdf/resume.pdf");
      final List<int> bytes = data.buffer.asUint8List();
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = "resume.pdf";
      html.document.body?.children.add(anchor);
      anchor.click();
      html.document.body?.children.remove(anchor);
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      log('Error downloading file: $e');
    }
  }

  static Future<void> downloadFirebaseFile(
    String storagePath, {
    Function(int received, int total)? onProgress,
  }) async {
    try {
      // Get reference to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref(storagePath);

      // Get download URL
      final String downloadURL = await storageRef.getDownloadURL();

      // Fetch the file content with Dio
      final response = await _dio.get(
        downloadURL,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
        onReceiveProgress: onProgress,
      );

      if (response.statusCode == 200) {
        // Create blob from response
        final blob = html.Blob([response.data]);
        final url = html.Url.createObjectUrlFromBlob(blob);

        // Create download element
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = storagePath.split('/').last; // Gets filename from path

        // Add to document, click, and cleanup
        html.document.body?.children.add(anchor);
        anchor.click();
        html.document.body?.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      } else {
        throw Exception('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      log('Error downloading Firebase file: $e');
      rethrow;
    }
  }

  static String getCopyrightText() {
    return "Copyright © ${DateTime.now().year} Boris. All Rights Reserved";
  }
}
