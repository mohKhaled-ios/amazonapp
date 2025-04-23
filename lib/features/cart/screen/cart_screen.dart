import 'package:amazonapp/features/cart/widget/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:amazonapp/common/widget/custom_button.dart';
import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/auth/widgets/address_user.dart';
import 'package:amazonapp/features/cart/widget/sub_total.dart';
import 'package:amazonapp/features/search/screen/search_screen.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:amazonapp/provider/user_provider.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigatetosearchscreen(String qurey) {
    Navigator.of(context).pushNamed(seachscreen.routename, arguments: qurey);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
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
            SubTotal(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Mycustombutton(
                text: 'proced to Buy ${user.cart.length}',
                onpress: () {},
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              color: Colors.black12.withOpacity(
                0.08,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListView.builder(
                itemCount: user.cart.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CartProduct(index: index);
                })
          ],
        ),
      ),
    );
  }
}
