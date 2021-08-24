import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.deepBlue,
      appBar: AppBar(),
      body: Container(
        color: MyTheme.deepBlue,
      ),
    );
  }
}
