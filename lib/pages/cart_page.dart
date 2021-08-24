import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(MyTheme.deepBlue).make(),
      ),
    );
  }
}
