import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //Making singleton class
  // static final cartModel = CartModel._internal();
  // CartModel._internal(); //constructor

  // factory CartModel() => cartModel;

  //catalog field
  CatalogModel _catalog;

  //collection of ids
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //getting items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
  //the static keyword has been removed from the getbyId and position method

  //getting the total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //adding item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //removing item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    // TODO: implement perform
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() {
    // TODO: implement perform
    store.cart._itemIds.remove(item.id);
  }
}
