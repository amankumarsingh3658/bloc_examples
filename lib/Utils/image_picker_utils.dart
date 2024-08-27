import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> camera() async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> gallery() async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
