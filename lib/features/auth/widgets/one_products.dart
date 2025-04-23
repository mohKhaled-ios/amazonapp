import 'package:flutter/material.dart';

class OneProducte extends StatelessWidget {
  final String myimage;
  OneProducte({super.key, required this.myimage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(5)),
        child: Container(
          width: 180,
          child: Image.network(
            myimage,
            fit: BoxFit.fitHeight,
            width: 180,
          ),
        ),
      ),
    );
  }
}
