import 'package:flutter/material.dart';
import 'package:hello_flutter/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      body: Center(
        child: Image.asset("assets/images/home.png"),
      ),
      drawer: Mydrawer(),
    );
  }
}
