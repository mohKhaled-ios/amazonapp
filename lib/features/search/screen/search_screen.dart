import 'package:amazonapp/common/widget/loader.dart';
import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/auth/widgets/address_user.dart';
import 'package:amazonapp/features/producte_details/screens/Producte_details.dart';
import 'package:amazonapp/features/search/services/search_services.dart';
import 'package:amazonapp/features/search/widget/search_product.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:flutter/material.dart';

class seachscreen extends StatefulWidget {
  final String searchqurey;
  static const String routename = '/searchscreen';
  const seachscreen({super.key, required this.searchqurey});

  @override
  State<seachscreen> createState() => _seachscreenState();
}

class _seachscreenState extends State<seachscreen> {
  List<Product>? products;
  final Searchservices searchservices = Searchservices();
  @override
  void initState() {
    super.initState();
    fetchsearchproducte();
  }

  fetchsearchproducte() async {
    products = await searchservices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchqurey);
    setState(() {});
  }

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
        body: products == null
            ? Loader()
            : Column(
                children: [
                  AddressUser(),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: products!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ProducteDetailsscreen.routename,
                                      arguments: products![index]);
                                },
                                child:
                                    Searchproducte(product: products![index]));
                          }))
                ],
              ));
  }
}
