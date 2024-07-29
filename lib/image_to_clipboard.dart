import 'dart:async';
import 'package:flutter/services.dart';

/// A plugin to copy images to the clipboard.
class ImageToClipboard {
  static const MethodChannel _channel = MethodChannel('image_to_clipboard');

  /// Copies an image to the clipboard.
  ///
  /// [imagePath] is the path of the image file to be copied to the clipboard.
  /// Returns a success message if the image is copied successfully, otherwise null.
  static Future<String?> copyImageToClipboard(String path) async {
    try {
      final String? result =
          await _channel.invokeMethod('copyImageToClipboard', {'path': path});
      return result;
    } on PlatformException catch (e) {
      return "Failed to copy image: '${e.message}'.";
    }
  }
}
