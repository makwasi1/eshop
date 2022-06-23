class PosterModal {
  String image;


  PosterModal({this.image});

  PosterModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = this.image;
    return data;
  }
}