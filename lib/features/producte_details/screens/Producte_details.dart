import 'package:amazonapp/common/widget/custom_button.dart';
import 'package:amazonapp/common/widget/stars.dart';
import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/producte_details/screens/services/producte_details_services.dart';
import 'package:amazonapp/features/search/screen/search_screen.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:amazonapp/provider/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProducteDetailsscreen extends StatefulWidget {
  static const String routename = "/product_details_screen";
  final Product product;
  const ProducteDetailsscreen({super.key, required this.product});

  @override
  State<ProducteDetailsscreen> createState() => _ProducteDetailsscreenState();
}

class _ProducteDetailsscreenState extends State<ProducteDetailsscreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigatetosearchscreen(String qurey) {
    Navigator.of(context).pushNamed(seachscreen.routename, arguments: qurey);
  }

  void addtocart() {
    productDetailsServices.addToCart(context: context, product: widget.product);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  Stars(rating: avgRating),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                widget.product.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider(
                items: widget.product.images.map((e) {
                  return Builder(
                      builder: (BuildContext context) => Image.network(
                            e,
                            fit: BoxFit.cover,
                            height: 150,
                          ));
                }).toList(),
                options: CarouselOptions()),
            Container(
              color: Colors.black26,
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                    text: 'price: ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    children: [
                      TextSpan(
                        text: '\$${widget.product.price}',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('${widget.product.description}'),
            ),
            Container(
              color: Colors.black26,
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Mycustombutton(text: 'BUY NOW', onpress: (() {})),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Mycustombutton(text: 'ADD TO CART ', onpress: addtocart),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black26,
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Rate The Producte',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            RatingBar.builder(
                initialRating: myRating,
                minRating: 1,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 5),
                direction: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Icon(Icons.star, color: Globalvar.secondarycolor),
                onRatingUpdate: (rating) {
                  productDetailsServices.rateProduct(
                      context: context,
                      product: widget.product,
                      rating: rating);
                }),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
    ;
  }
}
