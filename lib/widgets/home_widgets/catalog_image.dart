import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  // const CatalogImage({ Key? key }) : super(key: key);
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .roundedSM
        .clip(Clip.antiAlias)
        .color(MyTheme.creamWhite)
        .make()
        .w32(context)
        .p(8);
  }
}
