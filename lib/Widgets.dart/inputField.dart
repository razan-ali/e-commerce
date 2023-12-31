import 'package:flutter/material.dart';

import '../consts.dart';
import '../screenSize.dart';

Widget inputfield(
  BuildContext context,
  String name,
  String hintText,
  TextEditingController Controller,
) {
  final customBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  );

  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Relaway',
                fontWeight: FontWeight.w600,
                color: textColor,
                fontSize: ScreenSize.getScreenWidth(context, .04),
              ),
            ),
          ],
        ),
        SizedBox(
          height: ScreenSize.getScreenHeight(context, 0.01),
        ),
        Material(
          child: TextField(
            controller: Controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: ScreenSize.getScreenHeight(context, .01),
                horizontal: ScreenSize.getScreenWidth(context, .01),
              ),
              filled: true,
              fillColor: inputFields,
              enabledBorder: customBorder, // Use the custom rounded border
              focusedBorder:
                  customBorder, // Use the custom rounded border when focused

              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'Relaway',
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: ScreenSize.getScreenWidth(context, 0.035),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
