import 'package:assignment/register/Model/register_model.dart';
import 'package:assignment/register/farm_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ApiServices/api_services.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var response = RegisterModel().obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController business = TextEditingController();
  TextEditingController informalName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController registration_proof = TextEditingController();
  TextEditingController hours = TextEditingController();
}

Future<void> registerCont() async {
  try {
    final respo = await ApiServices().register(
        "john doe",
        "johndoe00@mail.com",
        "+19876543210",
        "12345678",
        "farmer",
        "dairy farm",
        "london dairy",
        "3663 Marshville Road",
        "Poughkeepsie",
        "New York",
        "12601",
        "my_proof.pdf",
        {
          "mon": ["8:00am - 10:00am", "10:00am - 1:00pm"],
          "tue": ["8:00am - 10:00am", "10:00am - 1:00pm"],
          "wed": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
          "thu": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
          "fri": ["8:00am - 10:00am", "10:00am - 1:00pm"],
          "sat": ["8:00am - 10:00am", "10:00am - 1:00pm"],
          "sun": ["8:00am -10:00am"]
        },
        "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
        "email/facebook/google/apple",
        "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx");

    if (respo.success == true) {
      var response = respo.obs;
      Get.snackbar("Registered!!!", response.value.message.toString());
      Get.to(() => FarmInfo());
    } else {
      throw "All fields are required";
    }
  } finally {
    throw "Server error while registering";
  }
}
