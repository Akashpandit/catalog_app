import 'dart:convert';

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_items.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    // Coverting the mapped data into a list
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartPage);
        },
        child: Icon(CupertinoIcons.cart),
        backgroundColor: MyTheme.deepBlue,
      ),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                //Bringing Data from JSON file
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            )),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  // const CatalogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.deepBlue).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
