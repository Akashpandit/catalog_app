class CatalogModel {
  static List<Item>
      items; //removed the first item from here to check the loading issue

  //get Item by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //get by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String image;
  final String color;

  Item({this.id, this.name, this.desc, this.price, this.image, this.color});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        image: map['image'],
        color: map['color']);
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "image": image,
        "color": color
      };
}
