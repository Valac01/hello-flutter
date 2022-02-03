import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hello_flutter/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool btnTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/login.png"),
              SizedBox(
                height: 24,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.indigo),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter User Name", label: Text("Username")),
                      onChanged: (val) {
                        name = val;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", label: Text("Password")),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          btnTapped = true;
                        });
                        await Future.delayed(Duration(milliseconds: 280));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        height: 46,
                        width: btnTapped ? 46 : 150,
                        alignment: Alignment.center,
                        child: btnTapped
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius:
                                BorderRadius.circular(btnTapped ? 46 : 5)),
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () {
                    //     log("hello");
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("Login".toUpperCase(),
                    //       style: TextStyle(fontSize: 18)),
                    //   style: ButtonStyle(
                    //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    //         EdgeInsets.symmetric(horizontal: 56, vertical: 10)),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
