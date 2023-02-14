import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';

class AuthRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> login({required body}) async {
    var response = await helper.post(url: ApiService.login, body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> register({required body}) async {
    var response = await helper.post(url: ApiService.register, body: body);
    var res = jsonDecode(response);
    return res;
  }
}
