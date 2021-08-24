import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  // const ItemWidget({ Key? key }) : super(key: key);
  final Item item;

  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key); //This Item class is created to show the catalog
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
