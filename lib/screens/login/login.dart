import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/screens/homePage.dart';
import 'package:car_store/screens/signup/singup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/buttons.dart';
import '../../core1/cWidget.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String loginWith;
  bool choice = false;
  late String passWord;
  late String email;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kprimaryColor,
        body: choice == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        choice = true;
                        loginWith = "phone";
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        choice = true;
                        loginWith = "email";
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "don't have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Get.to(() => Signup());
                        },
                        child: const Text(
                          "Sign up ",
                          style: TextStyle(
                            color: Color.fromRGBO(23, 119, 126, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            : Stack(children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          " Welcome back",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 363,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 15),
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(7, 10),
                              spreadRadius: 0,
                              blurStyle: BlurStyle.normal,
                              blurRadius: 10)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          GeneralButton(
                            onTap: () {
                              login(context, passWord, email, formkey);
                              // Get.to(() => HomePage());
                            },
                            text: "Login",
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "don't have an account? ",
                                style: TextStyle(
                                    color: kprimaryColor, fontSize: 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //Get.to(() => Signup());
                                },
                                child: const Text(
                                  " Sign up ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(23, 119, 126, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]));
  }
}

login(context, passWord, email, formkey) async {
  if (formkey.currentState!.validate()) {
    formkey.currentState!.save();
    try {
      showloading(context);
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passWord);
      if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
        Navigator.of(context).pop();
        showloadingForError(context,
            "your email is not active we will send the verify code again please check your email");
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      } else {
        Navigator.of(context).pop();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.of(context).pop();
        showloadingForError(context, ("No user found for that email"));
      } else if (e.code == 'wrong-password') {
        Navigator.of(context).pop();
        showloadingForError(context, (" incorrect password"));
      }
    } catch (e) {
      Navigator.of(context).pop();
      showloadingForError(context, (e.toString()));
    }
  }
}
