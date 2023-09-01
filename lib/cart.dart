import 'package:flutter/material.dart';
import './consts.dart';
import './screenSize.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: SizedBox()),
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
                onPressed: () {},
                child: const Text(
                  'Check Out',
                  style: TextStyle(
                      fontFamily: 'Relaway', fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
