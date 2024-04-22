import 'package:assignment/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class onboardingContents {
  String image;
  String title;
  String discription;
  Color color;

  onboardingContents({required this.image, required this.title, required this.discription, required this.color});
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;

  List<onboardingContents> contents = [
    onboardingContents(
        title: "Quality",
        image: 'assets/Group 44.png',
        discription:
            'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain. ',
        color: Colors.green
    ),
    onboardingContents(
        image: 'assets/Group.png',
        title: 'Convenient',
        discription: 'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
        color: const Color(0xFFD5715B)
    ),
    onboardingContents(
        title: 'Local',
        image: 'assets/Group 46.png',
        discription: 'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time. ',
        color: const Color(0xFFF8C569),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: PageView.builder(
          onPageChanged: (indexvalue){
            setState(() {
              currentIndex = indexvalue;
            });

          },
          scrollDirection: Axis.horizontal,
          itemCount: contents.length,
          itemBuilder: (_, i) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Container(
                      height: Get.height * 0.600,
                      width: Get.width,
                      decoration: BoxDecoration(color: contents[i].color, image: DecorationImage(image: AssetImage(contents[i].image))),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    // top: Get.height*0.600,
                    child: Container(
                        height: Get.height * 0.450,
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              contents[i].title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: Get.width*0.9,
                              child: Text(contents[i].discription,
                                style: const TextStyle(fontSize: 17),
                              ),
                            ),
                            SizedBox(height: Get.height*0.030,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                contents.length,
                                (index) => buildDot(index),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            OutlinedButton(
                                style:  ButtonStyle(backgroundColor: MaterialStatePropertyAll(contents[i].color)),
                                onPressed: () {},
                                child: const Text(
                                  'Join The Movment!',
                                  style: TextStyle(color: Colors.white),
                                )),
                            TextButton(
                                onPressed: () {
                                  Get.to(const MyLogin());
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                                )),
                          ],
                        ),
                      ))
              ],
            );
          },
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 10,
      width: currentIndex == index? 50 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: contents[index].color),
    );
  }
}
