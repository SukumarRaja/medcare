import 'package:get/get.dart';

class RoomBookingController extends GetxController {
  static RoomBookingController get to => Get.put(RoomBookingController());

  final _recommendationButtonIndex = 0.obs;

  get recommendationButtonIndex => _recommendationButtonIndex.value;

  set recommendationButtonIndex(value) {
    _recommendationButtonIndex.value = value;
  }

  final _favoriteOnTap = false.obs;

  get favoriteOnTap => _favoriteOnTap.value;

  set favoriteOnTap(value) {
    _favoriteOnTap.value = value;
  }

  final _isFavoriteSelected = false.obs;

  get isFavoriteSelected => _isFavoriteSelected.value;

  set isFavoriteSelected(value) {
    _isFavoriteSelected.value = value;
  }
}
