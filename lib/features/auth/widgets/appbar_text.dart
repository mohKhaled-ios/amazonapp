import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/models/user.dart';
import 'package:amazonapp/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppbarText extends StatelessWidget {
  const AppbarText({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: BoxDecoration(
        gradient: Globalvar.appcolor,
      ),
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'Hi, ',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: [
                  TextSpan(
                    text: user.name,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
