import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class CustomImageController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  // Single image
  Rx<XFile?> selectedImage = Rx<XFile?>(null);

  // Multiple images (optional)
  RxList<XFile> selectedImages = <XFile>[].obs;

  /// Pick a single image from gallery
  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image;
    }
  }

  /// Pick a single image from camera
  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = image;
    }
  }

  /// Pick multiple images from gallery
  Future<void> pickMultipleImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      selectedImages.assignAll(images);
    }
  }

  /// Clear selected images
  void clearImages() {
    selectedImage.value = null;
    selectedImages.clear();
  }

  /// Get File for preview or upload
  File? get selectedImageFile =>
      selectedImage.value != null ? File(selectedImage.value!.path) : null;
}
