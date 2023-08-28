import 'dart:ui';

import 'package:ecommerce/Widgets.dart/inputField.dart';
import 'package:flutter/material.dart';
import './screenSize.dart';
import './consts.dart';
import 'Widgets.dart/passField.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.3),
            ),
            Text(
              "Hello Again!",
              style: TextStyle(
                  color:
                      grayText, // Make sure grayText is defined in consts.dart
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenSize.getScreenHeight(context, 0.04),
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.1),
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
                      emailController,
                      "Email ",
                      "Enter your Email",
                      emailController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.06),
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
          ],
        ),
      ),
    );
  }
}
