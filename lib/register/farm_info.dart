import 'package:assignment/register/Controller/register_controller.dart';
import 'package:assignment/register/signup.dart';
import 'package:assignment/register/varification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmInfo extends StatefulWidget {
  const FarmInfo({super.key});

  @override
  State<FarmInfo> createState() => _FarmInfoState();
}

class _FarmInfoState extends State<FarmInfo> {
  final registerController = Get.put(RegisterController());
  String dropdownvalue = '';

  var items = ['', 'New York'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FarmerEats'),
        automaticallyImplyLeading: false,
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
                'Signup 2 of 4',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Farm Info',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: registerController.business,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_business_outlined),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Business Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: registerController.informalName,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.emoji_emotions_outlined),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Informal Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: registerController.address,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.home_outlined),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Street Addredd',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: registerController.city,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on_outlined),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'City',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'State',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton(
                            value: dropdownvalue,
                            icon: Icon(Icons.arrow_drop_down),
                            items: items
                                .map((String items) => DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            }),
                      ],
                    )),
                Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: registerController.zipcode,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        hintText: 'Enter Zipcode',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  // child: Center(
                  //     child: Text(
                  //   'Enter Zipcode',
                  //   style: TextStyle(fontSize: 17, color: Colors.grey),
                  // )),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      bottomNavigationBar:Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.030, vertical: Get.height*0.020),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.to(()=>SignUp());
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                )),
            OutlinedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Color(0xFFD5715B))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerificationPage()));
                },
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
          ],
        ),
      )
    );
  }
}
