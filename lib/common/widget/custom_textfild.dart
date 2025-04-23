import 'package:flutter/material.dart';

class Customtextfild extends StatelessWidget {
  final TextEditingController Controller;
  final String hinttext;
  final int maxline;
  const Customtextfild(
      {super.key,
      required this.Controller,
      required this.hinttext,
      this.maxline = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: Controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: hinttext),
        validator: ((val) {
          if (val == null || val.isEmpty) {
            return "Enter your $hinttext";
          }
          return null;
        }),
        maxLines: maxline,
      ),
    );
  }
}
