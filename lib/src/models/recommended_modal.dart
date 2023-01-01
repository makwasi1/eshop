class RecommendedModal {
  String image;
  String title;
  double price;
  double rating;
  int sale;

  RecommendedModal({this.image, this.title, this.price, this.rating, this.sale});

  RecommendedModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    price = json['price'];
    rating = json['rating'];
    sale = json['sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['price'] = price;
    data['rating'] = rating;
    data['sale'] = sale;
    return data;
  }
}