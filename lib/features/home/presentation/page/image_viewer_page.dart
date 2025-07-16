import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageViewerFromUrlScreen extends StatefulWidget {
  final String imageUrl;

  const ImageViewerFromUrlScreen({required this.imageUrl, super.key});

  @override
  State<ImageViewerFromUrlScreen> createState() =>
      _ImageViewerFromUrlScreenState();
}

class _ImageViewerFromUrlScreenState extends State<ImageViewerFromUrlScreen> {
  bool _downloading = false;

  Future<void> _saveImage() async {
    setState(() => _downloading = true);

    try {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        Get.snackbar(
          'Permission Denied',
          'Storage permission is required to save images.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      final response = await http.get(Uri.parse(widget.imageUrl));
      final Uint8List bytes = response.bodyBytes;

      final directory = await getExternalStorageDirectory();
      final String path =
          '${directory!.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final File file = File(path);

      await file.writeAsBytes(bytes);
      Get.to(
        SnackBar(
          content: Text('Image saved to: $path'),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save image: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      setState(() => _downloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
          child: CachedNetworkImage(
            imageUrl: widget.imageUrl,
            fit: BoxFit.contain,
            placeholder: (context, _) {
              return const CircularProgressIndicator.adaptive();
            },
            errorWidget: (_, __, ___) => const Icon(Icons.error),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _downloading ? null : _saveImage,
        tooltip: 'Save Image',
        child: _downloading
            ? const CircularProgressIndicator.adaptive()
            : const Icon(Icons.download),
      ),
    );
  }
}
