import 'package:flutter/material.dart';
import 'package:test_ff/models/product.dart';
import './consts.dart';
import './screenSize.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  ////////////////////////////////////
  int numberOfProducts = 0;
  List<Product> productList = [];
  double subtotal = 0.0;
  double delivery = 30.0;
  double total = 0.0;
  ////////////////////////////////////
  @override
  void initState() {
    super.initState();
    productList = [
      Product(
        id: 1,
        quantity: 10,
        pic: 'product_image1.jpg',
        name: 'Nike 1',
        price: 250,
      ),
      Product(
        id: 2,
        quantity: 5,
        pic: 'product_image2.jpg',
        name: 'Air force',
        price: 400,
      ),
    ];
    numberOfProducts = productList.length;
    subtotal = calculateSubtotal(productList);
    total = subtotal + delivery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            SizedBox(
              width: ScreenSize.getScreenWidth(context, 0.25),
            ),
            Text(
              "Cart",
              style: TextStyle(
                fontFamily: 'Relaway',
                color: grayText,
                fontWeight: FontWeight.w700,
                fontSize: ScreenSize.getScreenHeight(context, 0.03),
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: ScreenSize.getScreenHeight(context, 0.02),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$numberOfProducts Item ",
                  style: TextStyle(
                    fontFamily: 'Relaway',
                    color: grayText,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenSize.getScreenHeight(context, 0.02),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: numberOfProducts,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: Key(productList[index].id.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      productList.removeAt(index);
                      numberOfProducts--;
                      subtotal = calculateSubtotal(productList);
                      total = subtotal + delivery;
                    });
                  },
                  background: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          width: ScreenSize.getScreenWidth(context, 0.3),
                          height: ScreenSize.getScreenWidth(context, 0.3),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                                20), // Adjust the radius as needed
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.3), // Shadow color
                                spreadRadius: 2, // Shadow spread radius
                                blurRadius: 5, // Shadow blur radius
                                offset: Offset(0, 3), // Shadow offset
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: Card(
                    color: Colors.blue,
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: ScreenSize.getScreenHeight(context, 0.15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
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
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/nike.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.red,
                              width: ScreenSize.getScreenWidth(context, 0.3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    productList[index].name,
                                    style: TextStyle(
                                      fontFamily: 'Relaway',
                                      color: grayText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: ScreenSize.getScreenHeight(
                                          context, 0.02),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${productList[index].price} SR",
                                    style: TextStyle(
                                      fontFamily: 'Relaway',
                                      color: grayText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: ScreenSize.getScreenHeight(
                                          context, 0.02),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.blue,
                              width: ScreenSize.getScreenWidth(context, 0.3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        color: Colors.red,
                                        iconSize: 15,
                                        icon: Icon(Icons.remove,
                                            color: Colors.white),
                                        onPressed: () {
                                          setState(() {
                                            if (productList[index].quantity >
                                                1) {
                                              productList[index].quantity--;
                                            }
                                            subtotal =
                                                calculateSubtotal(productList);
                                            total = subtotal + delivery;
                                          });
                                        },
                                      ),
                                      Text(
                                        '${productList[index].quantity}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add,
                                            color: Colors.white),
                                        onPressed: () {
                                          setState(() {
                                            productList[index].quantity++;
                                            subtotal =
                                                calculateSubtotal(productList);
                                            total = subtotal + delivery;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      "${subtotal.toStringAsFixed(2)} SR",
                      style: TextStyle(
                        fontFamily: 'Relaway',
                        color: grayText,
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenSize.getScreenHeight(context, 0.02),
                        decoration: TextDecoration.none,
                      ),
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
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      "$delivery SR",
                      style: TextStyle(
                        fontFamily: 'Relaway',
                        color: grayText,
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenSize.getScreenHeight(context, 0.02),
                        decoration: TextDecoration.none,
                      ),
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
                    decoration: TextDecoration.none,
                  ),
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
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      "${total.toStringAsFixed(2)} SR",
                      style: TextStyle(
                        fontFamily: 'Relaway',
                        color: grayText,
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenSize.getScreenHeight(context, 0.02),
                        decoration: TextDecoration.none,
                      ),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Check Out',
                      style: TextStyle(
                        fontFamily: 'Relaway',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double calculateSubtotal(List<Product> products) {
    double subtotal = 0.0;
    for (var product in products) {
      subtotal += product.price * product.quantity;
    }
    return subtotal;
  }
}
