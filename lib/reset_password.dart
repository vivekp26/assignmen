import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
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
                "Reset Password",
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
                        onPressed: () {},
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
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: 'New Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: 'Confirm New Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFD5715B)),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
