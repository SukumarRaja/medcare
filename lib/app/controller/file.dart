import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FileController extends GetxController {
  static FileController get to => Get.put(FileController());

  final _isPicked = false.obs;

  get isPicked => _isPicked.value;

  set isPicked(value) {
    _isPicked.value = value;
  }

  final ImagePicker picker = ImagePicker();
  Uint8List? pickImage;

  pickProfileImage({required ImageSource source}) async {
    XFile? file = await picker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    } else {
      update();
      debugPrint("No image selected");
    }
  }

  selectGallery() async {
    var pick = await pickProfileImage(source: ImageSource.gallery);
    if (pick != null) {
      if (pick.isNotEmpty) {
        isPicked = true;
        pickImage = pick;
      }
    } else {
      debugPrint("Gallery image not selected");
    }
  }

  selectCamera() async {
    var pick = await pickProfileImage(source: ImageSource.camera);
    if (pick != null) {
      if (pick.isNotEmpty) {
        isPicked = true;
        pickImage = pick;
      }
    } else {
      debugPrint("Camera image not selected");
    }
  }
}