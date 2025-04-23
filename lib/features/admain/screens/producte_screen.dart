import 'dart:io';

import 'package:amazonapp/common/widget/custom_button.dart';
import 'package:amazonapp/common/widget/custom_textfild.dart';
import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/conastant/utils.dart';
import 'package:amazonapp/features/admain/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ProducteScreen extends StatefulWidget {
  static const String routename = '/productescreen';
  const ProducteScreen({super.key});

  @override
  State<ProducteScreen> createState() => _ProducteScreenState();
}

class _ProducteScreenState extends State<ProducteScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final _addProductFormKey = GlobalKey<FormState>();
  final AdmainServices admainServices = AdmainServices();
  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  String defaultvalue = 'Books';
  List<File> images = [];
  ///////////////////////////////////// خالى بالك
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void sellproducte() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      admainServices.addProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: defaultvalue,
          images: images);
    }
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
                'Add New Producte',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          preferredSize: Size.fromHeight(100)),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductFormKey,
            child: Column(
              children: [
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((e) {
                          return Builder(
                              builder: (BuildContext context) => Image.file(
                                    e,
                                    fit: BoxFit.cover,
                                    height: 150,
                                  ));
                        }).toList(),
                        options: CarouselOptions())
                    : SizedBox(
                        height: 5,
                      ),
                GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                      dashPattern: [10, 6],
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.folder,
                                size: 40,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Select Producte Image",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Customtextfild(
                  Controller: productNameController,
                  hinttext: "producte name",
                ),
                SizedBox(
                  height: 5,
                ),
                Customtextfild(
                  Controller: descriptionController,
                  hinttext: "producte description",
                  maxline: 8,
                ),
                SizedBox(
                  height: 5,
                ),
                Customtextfild(
                    Controller: priceController, hinttext: " producte price"),
                SizedBox(
                  height: 5,
                ),
                Customtextfild(
                    Controller: quantityController,
                    hinttext: "producte quantity"),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    value: defaultvalue,
                    onChanged: ((String? value) {
                      setState(() {
                        defaultvalue = value!;
                      });
                    }),
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Mycustombutton(text: 'Add', onpress: sellproducte)
              ],
            )),
      ),
    );
  }
}
