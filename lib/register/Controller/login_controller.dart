import 'package:assignment/ApiServices/api_services.dart';
import 'package:assignment/homepage.dart';
import 'package:assignment/register/Model/login_model.dart';
import 'package:assignment/register/varification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var response = LoginModel().obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> loginCont() async {
    try {
      isLoading(true);
      final respo = await ApiServices().login(
          email.text,
          password.text,
          "farmer",
          "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
          "email",
          "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx");
      if (respo.success == true) {
        response = respo.obs;
        Get.snackbar(
            "Login Successfully!!!", response.value.message.toString());
        Get.to(() => HomePage());
      } else {
        isLoading(false);
        response = respo.obs;
      }
    } finally {
      isLoading(false);
    }
  }
}
