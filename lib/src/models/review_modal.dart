class ReviewsModal {
  List<Data> data;

  ReviewsModal({this.data});

  ReviewsModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String title;
  String rating;
  String comment;
  String name;
  String status;

  Data(
      {this.id, this.title, this.rating, this.comment, this.name, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rating = json['rating'];
    comment = json['comment'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['rating'] = rating;
    data['comment'] = comment;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
