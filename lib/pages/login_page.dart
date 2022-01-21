import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset("assets/images/login.png"),
            SizedBox(
              height: 24,
            ),
            Text(
              "Login Page",
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
                  ElevatedButton(onPressed: () {}, child: Text("Login"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
