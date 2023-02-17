import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';
import '../model/doctor.dart';

class DashboardRepository {
  final HttpHelper helper = HttpHelper();

  Future<DoctorRes> getDoctors({required hospitalId}) async {
    var response = await helper.get(url: "${ApiService.getDoctors}$hospitalId");
    var res = DoctorRes.fromMap(jsonDecode(response));
    return res;
  }
}
