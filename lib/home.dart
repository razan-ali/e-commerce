import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './login.dart';
import './consts.dart';
import './screenSize.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: ScreenSize.getScreenWidth(context, 0.13),
        width: ScreenSize.getScreenWidth(context, 0.9),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(blueColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    9.0), // Adjust the border radius as needed
              ),
            ),
          ),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((_) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));

              print("Sign out successful");
            }).catchError((error) {
              print("Sign out failed: $error");
            });
          },
          child: const Text(
            'Sign Out',
            style:
                TextStyle(fontFamily: 'Relaway', fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
