import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/admain/screens/posts_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class AdmainScreen extends StatefulWidget {
  const AdmainScreen({super.key});

  @override
  State<AdmainScreen> createState() => _AdmainScreenState();
}

class _AdmainScreenState extends State<AdmainScreen> {
  int _pageindex = 0;
  List<Widget> pages = [
    Postesscreen(),
    Center(
      child: Text('reports page'),
    ),
    Center(
      child: Text('carttt'),
    ),
  ];
  void pageindex(int curentteindex) {
    setState(() {
      _pageindex = curentteindex;
    });
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
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/amazon_in.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text("Hi Admin")
                ],
              ),
            ),
            preferredSize: Size.fromHeight(100)),
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
                    child: Icon(Icons.analytics),
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
                    child: Icon(Icons.all_inbox),
                  ),
                  label: ''),
            ]));
  }
}
