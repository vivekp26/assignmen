import 'package:assignment/register/Model/verify_model.dart';
import 'package:assignment/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../ApiServices/api_services.dart';

class VerifyController extends GetxController {
  var isLoading = false.obs;
  var response = VerifyModel().obs;
  TextEditingController otp = TextEditingController();

  Future<void> verifyConst() async {
    try {
      isLoading(true);
      final respo = await ApiServices().verify(otp.text);
      if (respo.success == true) {
        response = respo.obs;
        Get.snackbar("895642", response.value.message.toString());
        Get.to(() => ResetPage());
      } else {
        isLoading(false);
        response = respo.obs;
      }
    } finally {
      isLoading(false);
    }
  }
}
