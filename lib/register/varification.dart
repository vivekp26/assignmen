import 'package:assignment/register/farm_info.dart';
import 'package:assignment/register/signup_hours.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

String? selectedFile;
String? selectedFileName;

class _VerificationPageState extends State<VerificationPage> {
  Future<void> selectPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        selectedFile = file.toString();
        selectedFileName = file.name.toString();
      });

      print("selectedFile : $selectedFile");
      print("selectedFilePath : $selectedFileName");

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: const Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: Get.width * 0.900,
            // color: Colors.blueGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.020,),

                const Text( 'Varification', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: Get.height * 0.020,),

                const Text('Attached proof of Department of Agriculture egistrations i.e. Florida Fresh, USDA Approved, USDA Organic', style: TextStyle(color: Colors.grey, fontSize: 14),),
                SizedBox(height: Get.height * 0.020,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Attach proof of registration',
                      style: TextStyle(fontSize: 22, color: Color(0xFF261C12)),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFD5715B)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              selectPdf();
                            });
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 35,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.020,
                ),

                // file name  container:
                selectedFileName!= null
                    ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: Get.height * 0.070,
                      width: Get.width * 0.700,
                      color: Colors.grey,
                      child: Text("$selectedFileName"),
                    ),
                    selectedFileName!= null?InkWell(
                        onTap: (){
                          setState(() {
                            selectedFileName = '';
                          });
                        },
                        child: Icon(Icons.cancel_outlined, color: Colors.blueGrey,)):Container()
                  ],
                ):Container(),

                SizedBox(height: Get.height * 0.020,),



              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.030, vertical: Get.height*0.020),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.to(()=>FarmInfo());
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 35,
                )),
            OutlinedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFFD5715B))),
                onPressed: () {
                  Get.to(() => const HoursPage());
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
