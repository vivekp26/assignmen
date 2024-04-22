import 'package:assignment/forgot_password.dart';
import 'package:assignment/homepage.dart';
import 'package:assignment/main.dart';
import 'package:assignment/register/Controller/login_controller.dart';
import 'package:assignment/register/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final loginController = Get.put(LoginController());

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
                "Welcome Back!",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "New here?",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SignUp());
                        },
                        child: Text(
                          'Create account',
                          style:
                          TextStyle(fontSize: 18, color: Color(0xFFD5715B)),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: loginController.email,
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: loginController.password,
                  decoration: InputDecoration(
                      suffix: InkWell(
                          onTap: () {
                            Get.to(() => Forgot());
                          },
                          child: Text(
                            "Forgot? ",
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFFD5715B)),
                          )),
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: 'Password',
                      // counterText: 'Forgot?',
                      counterStyle:
                      TextStyle(fontSize: 15, color: Color(0xFFD5715B)),
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
                  onPressed: () {
                    loginController.loginCont();
                  },
                  child: Obx(() {
                    return loginController.isLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                      'Login',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    );
                  })),
              SizedBox(
                height: 20,
              ),
              Text(
                'or Login with',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                      style: ButtonStyle(
                          iconColor: MaterialStatePropertyAll(Colors.blue)),
                      onPressed: () {
                        googleLoginFun();
                        },
                      child: Icon(
                        Icons.g_mobiledata,
                        size: 30,
                      )),
                  OutlinedButton(
                      style: ButtonStyle(
                          iconColor: MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {
                        signOutWithGoogle();
                      },
                      child: Icon(
                        Icons.apple_outlined,
                        size: 30,
                      )),
                  OutlinedButton(
                      style: ButtonStyle(
                          iconColor: MaterialStatePropertyAll(Colors.blue)),
                      onPressed: () {
                        facebookLogin();
                      },
                      child: Icon(
                        Icons.facebook_outlined,
                        size: 30,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount ? _user;
  String? fisrtname;
  String? lastName;

  GoogleSignInAccount? get user => _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> googleLoginFun() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    try {
      if (googleSignInAccount != null) {
        setState(() {});

        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(credential).then((value) async {
          print(value.user!.displayName.toString());
          print(value.user!.email.toString());
          print(value.user!.photoURL.toString());
          print(value.user!.phoneNumber.toString());
          String fullName = "${value.user!.displayName}";
          List<String> nameParts = fullName.split(' ');

          if (nameParts.isNotEmpty) {
            fisrtname = nameParts.first;
            lastName = nameParts.last;

            print("fisrtname :$fisrtname");
            print("lastName :$lastName");
            print("email :${value.user!.email.toString()}");
          } else {
            print('Invalid full name format');
          }
        });
      } else {
        // Stop googleLoading if the user does not select any account
        setState(() {});
      }
    } on Exception catch (e) {
      print("Error:$e");
      setState(() {});
    } finally {
      setState(() {});
    }
  }

  Future<Null> signOutWithGoogle() async {
    // Sign out with firebase
    final firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
    // Sign out with google
    await googleSignIn.signOut();
  }



  facebookLogin() async {
    print("FaceBook");
    try {
      final result =
      await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
      }
    } catch (error) {
      print(error);
    }
  }

}
