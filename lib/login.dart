import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_ff/explore.dart';
import './Widgets.dart/inputField.dart';
import './home.dart';
import './signUp.dart';
import './screenSize.dart';
import './consts.dart';
import 'Widgets.dart/passField.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.2),
            ),
            Text(
              "Hello Again!",
              style: TextStyle(
                  fontFamily: 'Relaway',
                  color: grayText,
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenSize.getScreenHeight(context, 0.04),
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.05),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.getScreenWidth(context, 0.05)),
                    child: inputfield(
                      context,
                      "Email Address",
                      "Enter your Email",
                      emailController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.04),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.getScreenWidth(context, 0.05)),
              child: PasswordField(
                controller: passController,
                name: 'Password',
                hintText: 'Enter your password',
                iconData: Icons.lock,
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              height: ScreenSize.getScreenWidth(context, 0.13),
              width: ScreenSize.getScreenWidth(context, 0.9),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(blueColor),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          9.0), // Adjust the border radius as needed
                    ),
                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text)
                      .then((UserCredential userCredential) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));

                    print("Sign in successful");
                  }).catchError((error) {
                    // This block will be executed if there's an error during sign-in.
                    print("Sign in failed: $error");
                  });
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                      fontFamily: 'Relaway', fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New User? ",
                  style: TextStyle(
                      fontFamily: 'Relaway', fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        fontFamily: 'Relaway', fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.1),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
