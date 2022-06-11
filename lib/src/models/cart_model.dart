class CartModal {
  String image;
  String title;
  String desc;
  double price;
  int quantity;

  CartModal({this.image, this.title, this.desc, this.price, this.quantity});

  CartModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['desc'] = desc;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}