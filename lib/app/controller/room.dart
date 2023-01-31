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

  final _checkoutStatus = "Book and Review".obs;

  get checkoutStatus => _checkoutStatus.value;

  set checkoutStatus(value) {
    _checkoutStatus.value = value;
  }

  final _isCheckoutStatus = true.obs;

  get isCheckoutStatus => _isCheckoutStatus.value;

  set isCheckoutStatus(value) {
    _isCheckoutStatus.value = value;
  }

  final _paymentCheckoutStatus = "".obs;

  get paymentCheckoutStatus => _paymentCheckoutStatus.value;

  set paymentCheckoutStatus(value) {
    _paymentCheckoutStatus.value = value;
  }

  final _isPaymentCheckoutStatus = false.obs;

  get isPaymentCheckoutStatus => _isPaymentCheckoutStatus.value;

  set isPaymentCheckoutStatus(value) {
    _isPaymentCheckoutStatus.value = value;
  }

  final _confirmCheckoutStatus = "".obs;

  get confirmCheckoutStatus => _confirmCheckoutStatus.value;

  set confirmCheckoutStatus(value) {
    _confirmCheckoutStatus.value = value;
  }

  final _isConfirmCheckoutStatus = false.obs;

  get isConfirmCheckoutStatus => _isConfirmCheckoutStatus.value;

  set isConfirmCheckoutStatus(value) {
    _isConfirmCheckoutStatus.value = value;
  }

  final _isAddContactDetail = false.obs;

  get isAddContactDetail => _isAddContactDetail.value;

  set isAddContactDetail(value) {
    _isAddContactDetail.value = value;
  }
}
