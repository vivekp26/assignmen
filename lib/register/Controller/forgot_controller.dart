// import 'package:assignment/register/Model/forgot_model.dart';
import 'package:assignment/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ApiServices/api_services.dart';
import '../Model/forgot_model.dart';

class ForgotController extends GetxController {
  var isLoading = false.obs;
  var response = ForgotModel().obs;
  TextEditingController mobile = TextEditingController();

  Future<void> forgotConst() async {
    try {
      isLoading(true);
      final respo = await ApiServices().forgot(mobile.text);
      if (respo.success == true) {
        response = respo.obs;
        Get.snackbar("163737", response.value.mobile.toString());
        Get.to(() => VerifyPage());
      } else {
        isLoading(false);
        response = respo.obs;
      }
    } finally {
      isLoading(false);
    }
  }
}
