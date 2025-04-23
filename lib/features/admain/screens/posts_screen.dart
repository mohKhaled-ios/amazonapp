import 'package:amazonapp/common/widget/loader.dart';
import 'package:amazonapp/features/account/screens/single_producte.dart';
import 'package:amazonapp/features/admain/screens/producte_screen.dart';
import 'package:amazonapp/features/admain/services/admin_services.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:flutter/material.dart';

class Postesscreen extends StatefulWidget {
  const Postesscreen({super.key});

  @override
  State<Postesscreen> createState() => _PostesscreenState();
}

class _PostesscreenState extends State<Postesscreen> {
  List<Product>? products;
  final AdmainServices admainServices = AdmainServices();

  void fetchallproducte() async {
    products = await admainServices.fetchAllProducts(context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchallproducte();
  }

  void addnewproducte() {
    Navigator.pushNamed(context, ProducteScreen.routename);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: products?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProducte(image: productData.images[0]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              productData.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_forever))
                        ],
                      )
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                addnewproducte();
              },
              tooltip: "add new producte",
              child: Icon(Icons.add),
            ),
          );
  }
}
