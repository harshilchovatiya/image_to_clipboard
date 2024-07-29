
# ImageToClipboard

A Flutter plugin to copy images to the clipboard on Android. This plugin allows you to easily copy image files to the clipboard, enabling quick and convenient image sharing within your Flutter apps.

## Description

`ImageToClipboard` is a simple and efficient plugin designed to facilitate the copying of images to the clipboard in Flutter applications. This plugin is currently supported on Android.

## Features

- Copy any image file to the clipboard.
- Easy to integrate with your existing Flutter projects.
- Handles file permissions and URI exposure securely.

## Getting Started

To use this plugin, follow the steps below:

### 1. Add Dependency

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  image_to_clipboard: ^0.0.1
```

### 2. Android Setup

In your Android project, you need to update the `AndroidManifest.xml` and provide a file provider path configuration.

#### Update `AndroidManifest.xml`

Add the following inside the `<application>` tag:

```xml
<provider
    android:name="androidx.core.content.FileProvider"
    android:authorities="${applicationId}.fileprovider"
    android:exported="false"
    android:grantUriPermissions="true">
    <meta-data
        android:name="android.support.FILE_PROVIDER_PATHS"
        android:resource="@xml/file_paths" />
</provider>
```

#### Create `file_paths.xml`

Create a new XML file named `file_paths.xml` in `android/app/src/main/res/xml/` directory with the following content:

```xml
<?xml version="1.0" encoding="utf-8"?>
<paths xmlns:android="http://schemas.android.com/apk/res/android">
    <external-path name="external_files" path="."/>
</paths>
```

### 3. Request Permissions

Ensure you request the necessary storage permissions in your app. You can use the `permission_handler` package for this purpose.

Add the following permissions to your `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

## Usage

Here’s a simple example of how to use the `ImageToClipboard` plugin:

```dart
import 'package:flutter/material.dart';
import 'package:image_to_clipboard/image_to_clipboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClipboardExample(),
    );
  }
}

class ClipboardExample extends StatefulWidget {
  @override
  _ClipboardExampleState createState() => _ClipboardExampleState();
}

class _ClipboardExampleState extends State<ClipboardExample> {
  String _status = 'Idle';

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
        title: Text('Clipboard Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Status: $_status'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Replace with the actual path of your image file
                String imagePath = '/path/to/your/image.png';
                _copyImage(imagePath);
              },
              child: Text('Copy Image to Clipboard'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Additional Information

- **Platform Support**: Currently, this plugin supports only Android. iOS support will be added in future releases.
- **Permissions**: Ensure that the necessary storage permissions are granted for the plugin to function correctly.
- **Contributions**: Contributions are welcome! Please open issues or submit pull requests for any improvements or feature requests.

For more detailed information and updates, visit the [GitHub repository](https://github.com/harshilchovatiya/image_to_clipboard).

---

By following the instructions and example provided, you can easily integrate the `ImageToClipboard` plugin into your Flutter applications and enable image copying to the clipboard on Android devices.
