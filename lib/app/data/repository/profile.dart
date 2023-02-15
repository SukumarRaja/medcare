import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';
import '../model/profile/profile.dart';
import '../model/profile/update.dart';

class ProfileRepository {
  final HttpHelper helper = HttpHelper();

  Future<ProfileRes> getProfile({required id}) async {
    var response = await helper.get(url: "${ApiService.getProfile}$id");
    var res = ProfileRes.fromMap(jsonDecode(response));
    return res;
  }

  Future<UpdateRes> updateProfile({required body}) async {
    var response = await helper.post(url: ApiService.updateProfile, body: body);
    var res = UpdateRes.fromMap(jsonDecode(response));
    return res;
  }
}
