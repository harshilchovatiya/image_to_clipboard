import 'package:flutter/material.dart';
import 'package:image_to_clipboard/image_to_clipboard.dart';

void main() {
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ClipboardExample(),
    );
  }
}

/// A widget demonstrating the use of the image clipboard plugin.
class ClipboardExample extends StatefulWidget {
  const ClipboardExample({super.key});

  @override
  State<ClipboardExample> createState() => _ClipboardExampleState();
}

class _ClipboardExampleState extends State<ClipboardExample> {
  String _status = 'Idle';

  /// Copies the image at the given [path] to the clipboard.
  Future<void> _copyImage(String path) async {
    String? result = await ImageToClipboard.copyImageToClipboard(path);
    setState(() {
      _status = result ?? 'Failed to copy image';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clipboard Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Status: $_status'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Replace with the actual path of your image file
                String imagePath = '/path/to/your/image.png';
                _copyImage(imagePath);
              },
              child: const Text('Copy Image to Clipboard'),
            ),
          ],
        ),
      ),
    );
  }
}
