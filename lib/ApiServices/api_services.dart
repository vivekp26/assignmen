import 'package:assignment/register/Model/forgot_model.dart';
import 'package:assignment/register/Model/login_model.dart';
import 'package:assignment/register/Model/verify_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../register/Model/register_model.dart';

class ApiServices {
  // Dio dio = Dio();
  final dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  Future<LoginModel> login(
      email, password, role, deviceToken, type, socialId) async {
    Map<String, dynamic> rawData = {
      "email": email,
      "password": password,
      "role": role,
      "device_token": deviceToken,
      "type": type,
      "social_id": socialId,
    };

    final user_value = await dio
        .post("https://sowlab.com/assignment/user/login", data: rawData);

    if (user_value.statusCode == 200) {
      final value_user = LoginModel.fromJson(user_value.data);
      return value_user;
    }
    throw "Something Went Wrong";
  }

  Future<ForgotModel> forgot(mobile) async {
    Map<String, dynamic> rawData = {
      "mobile": mobile,
    };
    final value = await dio.post(
        "https://sowlab.com/assignment/user/forgot-password",
        data: rawData);

    if (value.statusCode == 200) {
      final result = ForgotModel.fromJson(value.data);
      return result;
    }
    throw "Account with this mobile number does not exist.";
  }

  Future<VerifyModel> verify(otp) async {
    Map<String, dynamic> rawData = {
      "otp": otp,
    };
    final value = await dio
        .post("https://sowlab.com/assignment/user/verify-otp", data: rawData);

    if (value.statusCode == 200) {
      final result = VerifyModel.fromJson(value.data);
      return result;
    }
    throw "Invalid OTP.";
  }

  Future<RegisterModel> register(
      name,
      email,
      phone,
      password,
      role,
      business,
      informalName,
      address,
      city,
      state,
      zipcode,
      registration_proof,
      hours,
      device_token,
      type,
      social_id) async {
    Map<String, dynamic> rawData = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "role": role,
      "business_name": business,
      "informal_name": informalName,
      "address": address,
      "city": city,
      "state": state,
      "zip_code": zipcode,
      "registration_proof": registration_proof,
      "hours": hours,
      "device_token": device_token,
      "type": type,
      "social_id": social_id
    };
    final user_value = await dio
        .post('https://sowlab.com/assignment/user/register', data: rawData);
    if (user_value.statusCode == 200) {
      final result = RegisterModel.fromJson(user_value.data);
      return result;
    }
    throw "All fields are required.";
  }
}
