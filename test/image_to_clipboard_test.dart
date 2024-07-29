// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_to_clipboard/image_to_clipboard.dart';

void main() {
  const MethodChannel channel = MethodChannel('image_to_clipboard');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'copyImageToClipboard') {
        return 'Image copied to clipboard';
      }
      return null;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('copyImageToClipboard returns success message', () async {
    final result =
        await ImageToClipboard.copyImageToClipboard('/path/to/your/image.png');
    expect(result, 'Image copied to clipboard');
  });
}
