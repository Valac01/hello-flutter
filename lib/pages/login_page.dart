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
  final _formKey = GlobalKey<FormState>();
  onLogin(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return null;
    }
    setState(() {
      btnTapped = true;
    });
    await Future.delayed(Duration(milliseconds: 280));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      btnTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                            hintText: "Enter User Name",
                            label: Text("Username")),
                        onChanged: (val) {
                          name = val;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "User Name should not be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            label: Text("Password")),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password should not be empty";
                          } else if (value!.length < 8) {
                            return "Password length should be minimum 8 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(btnTapped ? 46 : 5),
                        child: InkWell(
                          onTap: () => onLogin(context),
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
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
