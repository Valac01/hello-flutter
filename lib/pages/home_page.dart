import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter/models/catalog.dart';
import 'package:hello_flutter/utils/routes.dart';
import 'package:hello_flutter/widgets/catalog.dart';
import 'package:hello_flutter/widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogData =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogData);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: MyTheme.darkBluishColor,
      ),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: CatalogHeader(),
        ),
        if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
          Expanded(child: CatalogList())
        else
          Center(
            child: CircularProgressIndicator(),
          ),
      ])),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: MyTheme.darkBluishColor),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "Trending Products",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: MyTheme.darkBluishColor),
        ),
      ],
    );
  }
}
