import 'package:assignment/loginpage.dart';
import 'package:assignment/register/Controller/forgot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final forgotController = Get.put(ForgotController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('FarmerEats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Remember your password?",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => MyLogin());
                        },
                        child: Text(
                          'Login',
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFFD5715B)),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: forgotController.mobile,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_outlined),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFD5715B)),
                  ),
                  onPressed: () {
                    forgotController.forgotConst();
                  },
                  child: Obx(() {
                    return forgotController.isLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            'Send Code',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          );
                  })),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
