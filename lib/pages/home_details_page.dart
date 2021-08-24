import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  // const HomeDetailsPage({ Key? key }) : super(key: key);
  final Item catalog;

  const HomeDetailsPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: MyTheme.deepBlue),
      ),
      backgroundColor: MyTheme.creamWhite,
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image).p16().h32(context),
              ),
              Expanded(
                child: VxArc(
                  height: 30,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.blueGrey.shade100,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyTheme.deepBlue)
                            .bold
                            .make(),
                        catalog.desc.text.make(),
                      ],
                    ).py64(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.xl.bold.xl.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Buy".text.xl2.make(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.deepBlue),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            ).wh(100, 40)
          ],
        ),
      ),
    );
  }
}
