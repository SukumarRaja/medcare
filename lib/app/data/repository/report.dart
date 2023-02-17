import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';
import '../model/report/vital.dart';

class ReportRepository {
  final HttpHelper helper = HttpHelper();

  Future<VitalSignRes> getVitalSigns({required userID}) async {
    var response = await helper.get(url: "${ApiService.getVitalSigns}$userID");
    var res = VitalSignRes.fromMap(jsonDecode(response));
    return res;
  }
}
