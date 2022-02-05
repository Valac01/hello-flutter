import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://avatars.githubusercontent.com/u/26054705?v=4";
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
              accountName: Text(
                "Barish Barla",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "barish.barla10@gmail.com",
                style: TextStyle(color: Colors.white),
              )),
        ),
        ListTile(
          leading: Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 1.4,
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 1.4,
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.email_outlined,
            color: Colors.white,
          ),
          title: Text(
            "Email",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 1.4,
          ),
        ),
      ]),
    );
  }
}
