import 'package:assignment/loginpage.dart';
import 'package:assignment/register/Controller/register_controller.dart';
import 'package:assignment/register/farm_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Signup 1 of 4',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Welcome!',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                    style: ButtonStyle(
                        iconColor: MaterialStatePropertyAll(Colors.blue)),
                    onPressed: () {},
                    child: Icon(
                      Icons.g_mobiledata,
                      size: 35,
                    )),
                OutlinedButton(
                    style: ButtonStyle(
                        iconColor: MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {},
                    child: Icon(
                      Icons.apple_outlined,
                      size: 35,
                    )),
                OutlinedButton(
                    style: ButtonStyle(
                        iconColor: MaterialStatePropertyAll(Colors.blue)),
                    onPressed: () {},
                    child: Icon(
                      Icons.facebook_outlined,
                      size: 30,
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text('or signup with',
                    style: TextStyle(fontSize: 15, color: Colors.grey))),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: registerController.name,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Full Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: registerController.email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: registerController.phone,
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: registerController.password,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: registerController.password,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Re-enter Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.030, vertical: Get.height*0.020),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  Get.to(()=>MyLogin());
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            OutlinedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Color(0xFFD5715B))),
                onPressed: () {
                  Get.to(() => FarmInfo());
                },
                child: Obx(() {
                  return registerController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : Text(
                    'Continue',
                    style:
                    TextStyle(fontSize: 20, color: Colors.white),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
