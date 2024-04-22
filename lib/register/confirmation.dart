import 'package:assignment/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Vector@1x-5.png')),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You’re all done!',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Hang tight!  We are currently reviewing your account and\n      will follow up with you in 2-3 business days. In the\n                meantime, you can setup your inventory.',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            OutlinedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFD5715B))),
                onPressed: () {
                  Get.to(() => MyLogin());
                },
                child: Text(
                  'Got it!',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
