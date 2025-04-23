import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/auth/widgets/address_user.dart';
import 'package:amazonapp/features/auth/widgets/carsole_images.dart';
import 'package:amazonapp/features/auth/widgets/categories.dart';
import 'package:amazonapp/features/auth/widgets/today_deal.dart';
import 'package:amazonapp/features/search/screen/search_screen.dart';
import 'package:amazonapp/provider/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  static const String routename = '/home';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void navigatetosearchscreen(String qurey) {
    Navigator.of(context).pushNamed(seachscreen.routename, arguments: qurey);
  }

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
                  Expanded(
                      child: Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 20),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 2,
                      child: TextFormField(
                        onFieldSubmitted: navigatetosearchscreen,
                        decoration: InputDecoration(
                            prefix: InkWell(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.search,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: (() {}),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(top: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                borderSide: BorderSide.none),
                            hintText: 'search'),
                      ),
                    ),
                  )),
                  Container(
                    color: Colors.transparent,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.mic_none,
                      size: 20,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            preferredSize: Size.fromHeight(100)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AddressUser(),
              SizedBox(
                height: 10,
              ),
              Categories(),
              SizedBox(
                height: 10,
              ),
              CarsoleImages(),
              TodayDeals()
            ],
          ),
        ));
  }
}
