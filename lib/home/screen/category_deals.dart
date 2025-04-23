import 'package:amazonapp/common/widget/loader.dart';
import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/home/services/home_services.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../features/producte_details/screens/Producte_details.dart';

class CategoryDeals extends StatefulWidget {
  static const String routename = '/category-deals';
  final String category;
  const CategoryDeals({super.key, required this.category});

  @override
  State<CategoryDeals> createState() => _CategoryDealsState();
}

class _CategoryDealsState extends State<CategoryDeals> {
  final HomeSevices homeSevices = HomeSevices();
  List<Product>? productelist;
  @override
  void initState() {
    super.initState();
    fetchcategoryproducts();
  }

  fetchcategoryproducts() async {
    productelist = await homeSevices.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: Globalvar.appcolor),
              ),
              title: Text(
                widget.category,
                style: TextStyle(color: Colors.black),
              )),
          preferredSize: Size.fromHeight(100)),
      body: productelist == null
          ? Loader()
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'keep shopping for ${widget.category}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productelist!.length,
                      padding: EdgeInsets.only(left: 15),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.4,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final producte = productelist![index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                ProducteDetailsscreen.routename,
                                arguments: producte);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 0.5)),
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child:
                                            Image.network(producte.images[0]))),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(
                                  left: 0,
                                  top: 5,
                                  right: 15,
                                ),
                                child: Text(
                                  producte.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
