import 'package:flutter/material.dart';
import 'package:hello_flutter/models/catalog.dart';
import 'package:hello_flutter/pages/CatalogDetailPage.dart';
import 'package:hello_flutter/widgets/theme.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items!.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items![index];
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CatalogDetailPage(catalog: catalog);
                }));
              },
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          CatalogImage(image: catalog.image),
          CatalogBody(catalog: catalog)
        ]));
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: MyTheme.creamColor, borderRadius: BorderRadius.circular(8)),
      child: Hero(
          tag: Key(image.toString()),
          child: Image.network(image, fit: BoxFit.contain)),
    );
  }
}

class CatalogBody extends StatelessWidget {
  final Item catalog;
  const CatalogBody({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            catalog.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            catalog.desc,
            softWrap: true,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${catalog.price.toString()}",
                style: TextStyle(fontSize: 18, color: MyTheme.darkBluishColor),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Buy"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyTheme.darkBluishColor,
                    ),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
