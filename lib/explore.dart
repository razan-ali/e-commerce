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
  List<String>? categories = ["All", "Outdoor", "Tennis", "Work"];

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
                        fontWeight: FontWeight.w600,
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
                itemCount: categories!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 6),
                    width: ScreenSize.getScreenWidth(context, 0.3),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.white),
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
                      child: Text(
                        categories![index],
                        style: TextStyle(
                            fontFamily: 'Relaway',
                            color: grayText,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none),
                      ),
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
                                child: Image.asset(
                                  'assets/heart.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 11),
                              height: ScreenSize.getScreenHeight(context, 0.1),
                              child: Image.asset(
                                'assets/nike.png',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: ScreenSize.getScreenWidth(
                                        context, 0.03),
                                  ),
                                  Text(
                                    "Nike Jordan",
                                    style: TextStyle(
                                        fontFamily: 'Relaway',
                                        color: grayText,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: ScreenSize.getScreenWidth(
                                        context, 0.03),
                                  ),
                                  Text(
                                    "550 RS",
                                    style: TextStyle(
                                        fontFamily: 'Relaway',
                                        color: grayText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenSize.getScreenHeight(
                                            context, 0.02),
                                        decoration: TextDecoration.none),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            blueColor, // Set the background color
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(15.0),
                                        ),
                                      ),
                                      height: 40,
                                      // Make width and height equal for a perfect circle
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
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
