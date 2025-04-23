import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/account/screens/account_screen.dart';
import 'package:amazonapp/features/cart/screen/cart_screen.dart';
import 'package:amazonapp/home/screen/home_screen.dart';
import 'package:amazonapp/provider/user_provider.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class Bottombar extends StatefulWidget {
  static const String routename = '/main-home';
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _pageindex = 0;
  List<Widget> pages = [Homepage(), AccounteScreen(), CartScreen()];
  void pageindex(int curentteindex) {
    setState(() {
      _pageindex = curentteindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final usercartlenght = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_pageindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageindex,
          selectedItemColor: Globalvar.selectednavbarcolor,
          unselectedItemColor: Globalvar.unselectednavbarcolor,
          backgroundColor: Globalvar.backgroundcolor,
          iconSize: 24,
          onTap: pageindex,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: _pageindex == 0
                        ? Globalvar.selectednavbarcolor
                        : Globalvar.backgroundcolor,
                    width: 5,
                  ))),
                  child: Icon(Icons.home_rounded),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: _pageindex == 1
                        ? Globalvar.selectednavbarcolor
                        : Globalvar.backgroundcolor,
                    width: 5,
                  ))),
                  child: Icon(Icons.person_rounded),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: _pageindex == 2
                        ? Globalvar.selectednavbarcolor
                        : Globalvar.backgroundcolor,
                    width: 5,
                  ))),
                  child: Badge(
                      elevation: 0,
                      badgeContent: Text('${usercartlenght}'),
                      child: Icon(Icons.shopping_cart_checkout_outlined)),
                ),
                label: ''),
          ]),
    );
  }
}
