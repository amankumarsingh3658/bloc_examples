
import 'package:bloc_examples/Utils/image_picker_utils.dart';
import 'package:bloc_examples/bloc/Image_Picker/image_picker_events.dart';
import 'package:bloc_examples/bloc/Image_Picker/image_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryCapture);
  }
  void _cameraCapture(
      CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.camera();
    emit(state.copyWith(file: file));
  }

  void _galleryCapture(
      GalleryImagePicker event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.gallery();
    emit(state.copyWith(file: file));
  }
}
