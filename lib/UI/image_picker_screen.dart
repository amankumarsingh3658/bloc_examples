import 'dart:io';
import 'package:bloc_examples/bloc/Image_Picker/image_picker_bloc.dart';
import 'package:bloc_examples/bloc/Image_Picker/image_picker_events.dart';
import 'package:bloc_examples/bloc/Image_Picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Bloc"),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          if (state.file == null) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(CameraCapture());
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(GalleryImagePicker());
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.browse_gallery),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Image.file(File(state.file!.path.toString())));
          }
        },
      ),
    );
  }
}
