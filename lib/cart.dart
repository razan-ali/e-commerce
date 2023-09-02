import 'dart:ffi';

import 'package:flutter/material.dart';
import './consts.dart';
import './screenSize.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgrey,
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: ScreenSize.getScreenHeight(context, 0.05),
          ),
          Text(
            "My Cart",
            style: TextStyle(
                fontFamily: 'Relaway',
                color: grayText,
                fontWeight: FontWeight.w700,
                fontSize: ScreenSize.getScreenHeight(context, 0.03),
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: ScreenSize.getScreenHeight(context, 0.02),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "3 Item ",
                  style: TextStyle(
                      fontFamily: 'Relaway',
                      color: grayText,
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenSize.getScreenHeight(context, 0.02),
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: ScreenSize.getScreenHeight(context, 0.55),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                  width: ScreenSize.getScreenWidth(context, 0.8),
                  child: Material(
                    elevation: 3, // Add shadow by specifying the elevation
                    borderRadius: BorderRadius.circular(
                        10.0), // Make it circular on all sides
                    child: Container(
                      height: ScreenSize.getScreenHeight(context, 0.15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10.0), // Duplicate this line for consistency
                        color: Colors.white, // Set the background color
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Color.fromARGB(255, 237, 237, 237),
                              ),
                              width: ScreenSize.getScreenWidth(context, 0.3),
                              height: ScreenSize.getScreenWidth(context, 0.3),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    8.0), // Add your desired padding here
                                child: Image.asset(
                                  'assets/nike.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenSize.getScreenWidth(context, 0.4),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Nike Club Max",
                                      style: TextStyle(
                                          fontFamily: 'Relaway',
                                          color: grayText,
                                          fontWeight: FontWeight.w600,
                                          fontSize: ScreenSize.getScreenHeight(
                                              context, 0.02),
                                          decoration: TextDecoration.none),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "584.99 SR",
                                      style: TextStyle(
                                          fontFamily: 'Relaway',
                                          color: grayText,
                                          fontWeight: FontWeight.w600,
                                          fontSize: ScreenSize.getScreenHeight(
                                              context, 0.02),
                                          decoration: TextDecoration.none),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
              width: ScreenSize.getScreenWidth(context, 1),
              height: ScreenSize.getScreenWidth(context, 0.5),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenSize.getScreenHeight(context, 0.02),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenSize.getScreenWidth(context, 0.1),
                      ),
                      Text(
                        "Subtotal",
                        style: TextStyle(
                            fontFamily: 'Relaway',
                            color: grayText,
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenSize.getScreenHeight(context, 0.02),
                            decoration: TextDecoration.none),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Text(
                        "753 SR",
                        style: TextStyle(
                            fontFamily: 'Relaway',
                            color: grayText,
                            fontWeight: FontWeight.w700,
                            fontSize: ScreenSize.getScreenHeight(context, 0.02),
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        width: ScreenSize.getScreenWidth(context, 0.1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenSize.getScreenWidth(context, 0.1),
                      ),
                      Text(
                        "Delivery",
                        style: TextStyle(
                            fontFamily: 'Relaway',
                            color: grayText,
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenSize.getScreenHeight(context, 0.02),
                            decoration: TextDecoration.none),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Text(
                        "30 SR",
                        style: TextStyle(
                            fontFamily: 'Relaway',
                            color: grayText,
                            fontWeight: FontWeight.w700,
                            fontSize: ScreenSize.getScreenHeight(context, 0.02),
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        width: ScreenSize.getScreenWidth(context, 0.1),
                      ),
                    ],
                  ),
                  Text(
                    "- - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - ",
                    style: TextStyle(
                        fontFamily: 'Relaway',
                        color: grayText,
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenSize.getScreenHeight(context, 0.02),
                        decoration: TextDecoration.none),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenSize.getScreenWidth(context, 0.1),
                      ),
                      Text(
                        "Total Cost",
                        style: TextStyle(
                            fontFamily: 'Relaway',
                            color: grayText,
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenSize.getScreenHeight(context, 0.02),
                            decoration: TextDecoration.none),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Text(
                        "30 SR",
                        style: TextStyle(
                            fontFamily: 'Relaway',
                            color: grayText,
                            fontWeight: FontWeight.w700,
                            fontSize: ScreenSize.getScreenHeight(context, 0.02),
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        width: ScreenSize.getScreenWidth(context, 0.1),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    height: ScreenSize.getScreenWidth(context, 0.13),
                    width: ScreenSize.getScreenWidth(context, 0.9),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(blueColor),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                9.0), // Adjust the border radius as needed
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontFamily: 'Relaway', fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
