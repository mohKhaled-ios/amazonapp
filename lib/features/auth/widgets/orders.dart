import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/auth/widgets/one_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Orders extends StatelessWidget {
  List mylist = [
    'https://images.unsplash.com/photo-1668544282220-a00da32f0e9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1668584044380-520997086ee0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1668544282220-a00da32f0e9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1668584044380-520997086ee0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
  ];
  Orders({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'MY Orders',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'see all',
                style: TextStyle(fontSize: 18, color: Globalvar.secondarycolor),
              ),
            ),
          ],
        ),
        Container(
            height: 150,
            padding: EdgeInsets.only(left: 5, top: 10, right: 0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mylist.length,
                itemBuilder: (context, index) {
                  return OneProducte(myimage: mylist[index]);
                })),
      ],
    );
  }
}
