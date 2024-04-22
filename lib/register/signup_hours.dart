import 'package:assignment/register/Controller/register_controller.dart';
import 'package:assignment/register/confirmation.dart';
import 'package:assignment/register/varification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoursPage extends StatefulWidget {
  const HoursPage({super.key});

  @override
  State<HoursPage> createState() => _HoursPageState();
}

class _HoursPageState extends State<HoursPage> {
  final registerController = Get.put(RegisterController());
  List<String> timeSlots = [
    '8:00 AM - 10:00 AM',
    '10:00 AM - 1:00 PM',
    '1:00 PM - 4:00 PM',
    '04:00 PM - 7:00 PM',
    '7:00 PM - 10:00 PM',
  ];

  List dayName = [
    'M',
    'T',
    'W',
    'Th',
    'F',
    's',
  ];

  var selectedTime;
  var selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('FarmerEats'),
        ),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Signup 4 of 4',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Business Hours',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: Get.width * 0.9,
                height: Get.height * 0.050,
                // color: Colors.red,
                child: ListView.separated(
                  itemCount: dayName.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedDay = dayName[index];
                          print("selectedDay : $selectedDay");
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: selectedDay == dayName[index] ? Color(0xFFD5715B) : null,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all()),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              registerController.hours;
                            },
                            child: Text(
                              dayName[index],
                              style: TextStyle(fontSize: 15, color: Colors.grey.shade500, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: Get.width * 0.030,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                childAspectRatio: 3,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                children: List.generate(timeSlots.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = timeSlots[index];
                        print("selectedTime : $selectedTime");
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: selectedTime == timeSlots[index] ? Color(0XFFF8C569) : null,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all()),
                      child: Text(
                        timeSlots[index],
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  );
                }),
              ),
            ),

          ]),

        ),
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.030, vertical: Get.height*0.020),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.to(()=>VerificationPage());
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                )),
            OutlinedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFFD5715B))),
                onPressed: () {
                  Get.to(() => ConfirmationPage());
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
          ],
        ),
      ),

    );

  }
}
