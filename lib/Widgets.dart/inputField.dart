import 'package:flutter/material.dart';

import '../consts.dart';
import '../screenSize.dart';

Widget inputfield(
  BuildContext context,
  TextEditingController nameController,
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
                color: textColor,
                fontSize: ScreenSize.getScreenWidth(context, .03),
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
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    ),
  );
}
