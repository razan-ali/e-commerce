import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './Widgets.dart/inputField.dart';
import './Widgets.dart/passField.dart';
import './login.dart';
import './consts.dart';
import './screenSize.dart';

class SignUp extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                decoration: TextDecoration.none,
              ),
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
                      "Your Name",
                      "Enter your name",
                      nameController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.03),
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
              height: ScreenSize.getScreenHeight(context, 0.03),
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
                      .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text)
                      .then((UserCredential userCredential) {
                    //i need to redirec the user to the main page
                    print("Create account");
                  }).catchError((error) {
                    print("Something went wrong: $error");
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
                  "Already Have Account? ",
                  style: TextStyle(
                      fontFamily: 'Relaway', fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    // Replace the below line with the appropriate route for your registration page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    "Sign in",
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
    );
  }
}
