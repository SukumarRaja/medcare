import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';
import '../model/appointment/appointment.dart';

class AppointmentRepository {
  final HttpHelper helper = HttpHelper();

  Future<AppointmentRes> getAppointments({required userId}) async {
    var response = await helper.get(url: "${ApiService.getAppointments}$userId");
    var res = AppointmentRes.fromMap(jsonDecode(response));
    return res;
  }
}
