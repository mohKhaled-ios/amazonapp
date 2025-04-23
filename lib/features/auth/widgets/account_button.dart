import 'package:amazonapp/conastant/global_var.dart';
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AccountButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Globalvar.secondarycolor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: OutlinedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white)),
      ),
    );
  }
}
