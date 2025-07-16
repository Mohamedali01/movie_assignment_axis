import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_assignment_axis/core/dependency_injection.dart';
import 'package:movie_assignment_axis/features/home/presentation/cubit/home_cubit.dart';
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
  final homeCubit = sl<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>.value(
      value: homeCubit,
      child: Scaffold(
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
        floatingActionButton: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is PermissionDenied) {
              Get.snackbar(
                'Permission Denied',
                'Storage permission is required to save images.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            } else if (state is ImageSavedState) {
              Get.to(
                SnackBar(
                  content: Text('Image saved to: ${state.imagePath}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            } else if (state is ErrorSavingFile) {
              Get.snackbar(
                'Error',
                'Failed to save image: ${state.error}',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          },
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: homeCubit.downloading
                  ? null
                  : () {
                      homeCubit.saveImage(widget.imageUrl);
                    },
              tooltip: 'Save Image',
              child: homeCubit.downloading
                  ? const CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    )
                  : const Icon(Icons.download),
            );
          },
        ),
      ),
    );
  }
}
