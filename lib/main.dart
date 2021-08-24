import 'package:catalog_app/pages/LoginPage.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   fontFamily: GoogleFonts.lato().fontFamily,
      //   primaryTextTheme: GoogleFonts.latoTextTheme(),
      // ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartPage: (context) => CartPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
