import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController get to => Get.put(PaymentController());

  final _paymentMethodSelectIndex = 6.obs;

  get paymentMethodSelectIndex => _paymentMethodSelectIndex.value;

  set paymentMethodSelectIndex(value) {
    _paymentMethodSelectIndex.value = value;
  }

  final _roomBookingPaymentMethodSelectIndex = 6.obs;

  get roomBookingPaymentMethodSelectIndex =>
      _roomBookingPaymentMethodSelectIndex.value;

  set roomBookingPaymentMethodSelectIndex(value) {
    _roomBookingPaymentMethodSelectIndex.value = value;
  }
}
