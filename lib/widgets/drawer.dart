import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // const MyDrawer({ Key? key }) : super(key: key);
  final username = 'Akash';
  final usermail = "akaashpandit1@gmail.com";

  @override
  Widget build(BuildContext context) {
    final imageurl =
        "https://www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?ezimgfmt=rs:254x254/rscb2";
    return Drawer(
      child: Container(
        color: Colors.blue[800],
        child: ListView(children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,

              decoration: BoxDecoration(color: Colors.indigo.shade800),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
              ),
              // currentAccountPicture: Image.network(imageurl),
              accountName: Text(
                username,
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                usermail,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          drawerTiles(Icons.home, "Home"),
          drawerTiles(Icons.person, "Profile"),
          drawerTiles(Icons.email, "Contact Us"),
          ListTile(
            onTap: () => Navigator.pushNamed(context, MyRoutes.loginRoute),
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.3,
            ),
          )
        ]),
      ),
    );
  }
}

Widget drawerTiles(IconData icon, String name) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.white,
    ),
    title: Text(
      name,
      style: TextStyle(color: Colors.white),
      textScaleFactor: 1.3,
    ),
  );
}
