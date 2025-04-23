import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/auth/widgets/appbar_text.dart';
import 'package:amazonapp/features/auth/widgets/main_button.dart';
import 'package:amazonapp/features/auth/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccounteScreen extends StatelessWidget {
  const AccounteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: Globalvar.appcolor),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.notifications_on_rounded),
                      ),
                      Icon(Icons.search_rounded)
                    ],
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: Column(
        children: [
          AppbarText(),
          SizedBox(
            width: 15,
          ),
          Mainbutton(),
          SizedBox(
            height: 15,
          ),
          Orders(),
        ],
      ),
    );
  }
}
