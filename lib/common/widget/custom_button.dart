import 'package:flutter/material.dart';

class Mycustombutton extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  const Mycustombutton({super.key, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      child: Text(text),
      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
    );
  }
}
