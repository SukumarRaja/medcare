import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repository/auth.dart';
import '../ui/screens/home/main.dart';
import '../ui/widgets/common_alert.dart';
import '../ui/widgets/common_print.dart';
import '../ui/widgets/common_snackbar.dart';
import 'main.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  final repository = AuthRepository();

  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();

  // login textController
  TextEditingController lEmail = TextEditingController();
  TextEditingController lPassword = TextEditingController();

  // register textController
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  final _loginLoading = false.obs;

  get loginLoading => _loginLoading.value;

  set loginLoading(value) {
    _loginLoading.value = value;
  }

  final _registerLoading = false.obs;

  get registerLoading => _registerLoading.value;

  set registerLoading(value) {
    _registerLoading.value = value;
  }

  storeLocalDevice({required Map body}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    body.forEach((key, value) {
      debugPrint('index=$key, value=$value');
      preferences.setString(key, value);
    });
  }

  registerFieldsEmpty() {
    name.text = "";
    email.text = "";
    phone.text = "";
    password.text = "";
  }

  loginFieldsEmpty() {
    lEmail.text = "";
    lPassword.text = "";
  }

  loginCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('patientId');
    debugPrint("patientId $token");
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  login() async {
    loginLoading = true;
    var body = {"email": lEmail.text.trimRight(), "password": lPassword.text};
    try {
      var res = await repository.login(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          loginLoading = false;
          commonPrint(status: res['status'], msg: res['message']);
          Map storedData = {"patientId": "${res['patient_id']}"};
          storeLocalDevice(body: storedData);
          Get.off(() => HomeMain());
          commonSnackBar(title: "Success", msg: "Login Successfully");
          loginFieldsEmpty();
        } else if (res['status'] == "422") {
          loginLoading = false;
          commonPrint(
              status: res['status'],
              msg: "${res['message']}\nEmail or Password Wrong");
          errorAlert(Get.context!,
              content: "${res['message']}\nEmail or Password Wrong",
              confirmButtonPressed: () {
            Get.back();
          });
        }
      } else {
        loginLoading = false;
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      loginLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from login due to data mismatch or format $e");
    }
  }

  register() async {
    registerLoading = true;
    var body = {
      "name": name.text,
      "email": email.text.trimRight(),
      "mobile": phone.text,
      "password": password.text
    };
    try {
      var res = await repository.register(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          if (res['message'] == "Email Duplicated") {
            registerLoading = false;
            commonPrint(status: res['status'], msg: res['message']);
            errorAlert(Get.context!,
                content: "${res['message']}\nEmail already exist",
                confirmButtonPressed: () {
              Get.back();
            });
          } else {
            registerLoading = false;
            commonPrint(status: res['status'], msg: res['message']);
            Map storedData = {"patientId": "${res['patient_id']}"};
            storeLocalDevice(body: storedData);
            Get.off(() => HomeMain());
            commonSnackBar(title: "Success", msg: "Register Successfully");
            registerFieldsEmpty();
          }
        } else if (res['status'] == "422") {
          registerLoading = false;
          commonPrint(status: res['status'], msg: "All fields are required");
          errorAlert(Get.context!, content: "All fields are required",
              confirmButtonPressed: () {
            Get.back();
          });
        }
      } else {
        registerLoading = false;
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      registerLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from register due to data mismatch or format $e");
    }
  }
}
