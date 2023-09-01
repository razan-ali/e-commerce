import 'package:flutter/material.dart';
import 'package:test_ff/Widgets.dart/inputField.dart';
import './consts.dart';
import './screenSize.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String selectedOption = "ALL";

  TextEditingController searchCont = TextEditingController();
  final customBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgrey,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.07),
            ),
            Text(
              "Explore",
              style: TextStyle(
                  fontFamily: 'Relaway',
                  color: grayText,
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenSize.getScreenHeight(context, 0.04),
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.01),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 3), // Offset of the shadow
                  ),
                ],
              ),
              child: TextField(
                controller: searchCont,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenSize.getScreenHeight(context, 0.01),
                    horizontal: ScreenSize.getScreenWidth(context, 0.01),
                  ),
                  filled: true,
                  fillColor: inputFields,
                  hintText: "Looking for what? ",
                  hintStyle: TextStyle(
                    fontFamily: 'Relaway',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: ScreenSize.getScreenWidth(context, 0.035),
                  ),
                  prefixIcon:
                      Icon(Icons.search), // Add your desired prefix icon
                  border: customBorder,
                  // Use the customBorder you defined
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.getScreenHeight(context, 0.01),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Select Category",
                    style: TextStyle(
                        fontFamily: 'Relaway',
                        color: grayText,
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenSize.getScreenHeight(context, 0.02),
                        decoration: TextDecoration.none),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: ScreenSize.getScreenHeight(context, 0.1),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 6),
                    width: ScreenSize.getScreenWidth(context, 0.3),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                9.0), // Adjust the border radius as needed
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Outdoor"),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 11,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 150,
                    margin: EdgeInsets.all(10.0),
                    child: Card(
                      color: Colors.white,
                      // Wrap the container with a Card
                      elevation: 2, // Add shadow by specifying the elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15.0), // Make the border circular
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 11),
                                  child: Icon(Icons.heart_broken_outlined))
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 11),
                              color: Colors.black,
                              height: ScreenSize.getScreenHeight(context, 0.1)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nike Jordan",
                                style: TextStyle(
                                    fontFamily: 'Relaway',
                                    color: grayText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenSize.getScreenHeight(
                                        context, 0.02),
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                "150RS",
                                style: TextStyle(
                                    fontFamily: 'Relaway',
                                    color: grayText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenSize.getScreenHeight(
                                        context, 0.02),
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
