import 'package:amazonapp/common/widget/loader.dart';
import 'package:amazonapp/features/producte_details/screens/Producte_details.dart';
import 'package:amazonapp/home/services/home_services.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:flutter/material.dart';

class TodayDeals extends StatefulWidget {
  const TodayDeals({super.key});

  @override
  State<TodayDeals> createState() => _TodayDealsState();
}

class _TodayDealsState extends State<TodayDeals> {
  Product? product;
  final HomeSevices homeSevices = HomeSevices();
  @override
  void initState() {
    super.initState();
    featchDealsofDay();
  }

  void featchDealsofDay() async {
    product = await homeSevices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navagatetoDetailscreen() {
    Navigator.of(context)
        .pushNamed(ProducteDetailsscreen.routename, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? Loader()
        : product!.name.isEmpty
            ? SizedBox()
            : GestureDetector(
                onTap: navagatetoDetailscreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
                      child: Text(
                        'Deal of the day ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Image.network(
                      product!.images[0],
                      height: 130,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15, top: 15, bottom: 5),
                      child: Text(
                        "\$200",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15, top: 15, bottom: 50),
                      child: Text(
                          "AC takeef AC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeefAC takeef",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15)),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: product!.images
                            .map(
                              (e) => Image.network(
                                e,
                                width: 150,
                                height: 100,
                                fit: BoxFit.fitWidth,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'see all details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueAccent),
                      ),
                    )
                  ],
                ),
              );
  }
}
