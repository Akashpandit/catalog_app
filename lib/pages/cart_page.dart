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
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  // const _cartTotal({ Key? key }) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl4.color(MyTheme.deepBlue).make(),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "We are yet to support buying.".text.make(),
                ),
              );
            },
            child: "Buy".text.make(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.deepBlue),
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  // const _cartList({ Key? key }) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: "Item 1".text.make(),
        trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
      ),
      itemCount: 5,
    );
  }
}
