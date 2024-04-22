import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Column(
            children: [
              Center(
                  child: Text('HomePage',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
