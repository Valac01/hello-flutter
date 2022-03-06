import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hello_flutter/models/catalog.dart';
import 'package:hello_flutter/widgets/theme.dart';

class CatalogDetailPage extends StatelessWidget {
  final Item catalog;
  const CatalogDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
              height: 400,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
              child: Hero(
                  tag: Key(catalog.image.toString()),
                  child: Image.network(catalog.image))),
          Expanded(
              child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 56,
                  ),
                  Text(
                    catalog.name,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(catalog.desc,
                      softWrap: true, style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: ButtonBar(
        buttonPadding: EdgeInsets.symmetric(horizontal: 14),
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$${catalog.price.toString()}",
            style: TextStyle(fontSize: 24, color: MyTheme.darkBluishColor),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Buy",
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  MyTheme.darkBluishColor,
                ),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                )),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.quadraticBezierTo(size.width / 2, 80, 0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
