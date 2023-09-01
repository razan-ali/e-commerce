import 'package:flutter/material.dart';
import 'package:test_ff/cart.dart';
import 'package:test_ff/consts.dart';
import 'package:test_ff/explore.dart';
import 'package:test_ff/screenSize.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currectTab = 0;
  final List<Widget> screens = [
    explore(),
    cart(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currectScreen = explore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: PageStorage(
        child: currectScreen,
        bucket: bucket,
      ),
      floatingActionButton: ClipOval(
        child: Container(
          width: ScreenSize.getScreenWidth(context, 0.16),
          height: ScreenSize.getScreenHeight(context, 0.08),
          child: FloatingActionButton(
            backgroundColor: blueColor,
            child: Image.asset(
              'assets/bag.png', // Replace with the actual path to your image
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => cart()));
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        shadowColor: grayText,
        elevation: 20.0, // Adjust the elevation to increase the shadow
        shape: CircularNotchedRectangle(),
        notchMargin: ScreenSize.getScreenHeight(context, 0.02),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currectScreen = explore();
                        currectTab = 0;
                        print(currectTab);
                        print("|333");
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/home.png', // Replace with the actual path to your image
                            color: currectTab == 0 ? Colors.blue : Colors.grey,
                            width: 24, // Set the width and height as needed
                            height: 24,
                          )
                        ]),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currectScreen = explore();
                        currectTab = 0;
                        print(currectTab);
                        print("|222");
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Icon.png', // Replace with the actual path to your image
                            color: currectTab == 1 ? Colors.blue : Colors.grey,
                            width: 24, // Set the width and height as needed
                            height: 24,
                          )
                        ]),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currectScreen = cart();
                        currectTab = 1;
                        print(currectTab);
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Vector.png',
                            color: currectTab == 2 ? Colors.blue : Colors.grey,
                            width: 24,
                            height: 24,
                          )
                        ]),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currectScreen = explore();
                        currectTab = 0;
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/frame.png', // Replace with the actual path to your image
                            color: currectTab == 3 ? Colors.blue : Colors.grey,
                            width: 24, // Set the width and height as needed
                            height: 24,
                          )
                        ]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
