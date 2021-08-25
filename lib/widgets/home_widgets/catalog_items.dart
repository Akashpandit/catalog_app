import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/home_details_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  // const CatalogItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog.name.text.lg.color(MyTheme.deepBlue).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.xl.bold.make(),
                    ElevatedButton(
                      onPressed: () {},
                      child: "Buy".text.make(),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.deepBlue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ).square(200).rounded.white.make().py16();
  }
}

class CatalogList extends StatelessWidget {
  // const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailsPage(
                        catalog: catalog,
                      ),
                    ),
                  ),
                },
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
