import 'package:flutter/material.dart';
import '../consts.dart';
import '../screenSize.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final String hintText;
  final IconData iconData;

  const PasswordField({
    required this.controller,
    required this.name,
    required this.hintText,
    required this.iconData,
  });
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide.none, // Remove the color from the border
    );

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontFamily: 'Relaway',
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: ScreenSize.getScreenWidth(context, .04),
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenSize.getScreenHeight(context, 0.01)),
          Material(
            child: TextField(
              controller: widget.controller,
              obscureText:
                  passwordVisible, // Set obscureText to hide or show the password
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                filled: true,
                fillColor: inputFields,
                enabledBorder: customBorder, // Use the custom rounded border
                focusedBorder:
                    customBorder, // Use the custom rounded border when focused
                suffixIcon: IconButton(
                  icon: Icon(
                    color: Colors.grey,
                    passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
                hintText: widget.hintText,
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
}
