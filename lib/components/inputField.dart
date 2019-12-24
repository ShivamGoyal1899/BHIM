import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;

  InputField(
      {this.hintText,
      this.controller,
      this.focusNode,
      this.keyboardType,
      this.textCapitalization});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 8,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0))),
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              textCapitalization: widget.textCapitalization,
              focusNode: widget.focusNode,
              autofocus: false,
              obscureText: false,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      color: Color(0xFFA1A1A1),
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ),
    );
  }
}
