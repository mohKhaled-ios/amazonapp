import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/home/screen/category_deals.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  void tocategorypage(BuildContext context, String category) {
    Navigator.of(context)
        .pushNamed(CategoryDeals.routename, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Globalvar.categoriesimages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (() => tocategorypage(
                    context, Globalvar.categoriesimages[index]['title']!)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          Globalvar.categoriesimages[index]['image']!,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Globalvar.categoriesimages[index]['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }));
  }
}
