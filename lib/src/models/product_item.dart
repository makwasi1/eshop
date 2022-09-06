import 'package:eshop/src/models/products_model.dart';

class ProductItemModel {
  ProductItem data;

  ProductItemModel({this.data});

  ProductItemModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ProductItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class ProductItem {
  int id;
  String type;
  String name;
  String urlKey;
  String price;
  String formatedPrice;
  String shortDescription;
  String description;
  String sku;
  List<Images> images;
  BaseImage baseImage;
  List<Variants> variants;
  bool inStock;
  Reviews reviews;
  bool isSaved;
  String createdAt;
  String updatedAt;

  ProductItem(
      {this.id,
      this.type,
      this.name,
      this.urlKey,
      this.price,
      this.formatedPrice,
      this.shortDescription,
      this.description,
      this.sku,
      this.images,
      this.baseImage,
      this.variants,
      this.inStock,
      this.reviews,
      this.isSaved,
      this.createdAt,
      this.updatedAt});

  ProductItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    urlKey = json['url_key'];
    price = json['price'];
    formatedPrice = json['formated_price'];
    shortDescription = json['short_description'];
    description = json['description'];
    sku = json['sku'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    baseImage = json['base_image'] != null
        ? new BaseImage.fromJson(json['base_image'])
        : null;
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants.add( Variants.fromJson(v));
      });
    }
    inStock = json['in_stock'];
    reviews =
        json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
    isSaved = json['is_saved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['url_key'] = urlKey;
    data['price'] = price;
    data['formated_price'] = formatedPrice;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['sku'] = sku;
    if (images != null) {
      data['images'] = images.map((v) => v.toJson()).toList();
    }
    if (baseImage != null) {
      data['base_image'] = baseImage.toJson();
    }
    if (variants != null) {
      data['variants'] = variants.map((v) => v.toJson()).toList();
    }
    data['in_stock'] = inStock;
    if (reviews != null) {
      data['reviews'] = reviews.toJson();
    }
    data['is_saved'] = isSaved;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Images {
  int id;
  String path;
  String url;
  String originalImageUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;

  Images(
      {this.id,
      this.path,
      this.url,
      this.originalImageUrl,
      this.smallImageUrl,
      this.mediumImageUrl,
      this.largeImageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    url = json['url'];
    originalImageUrl = json['original_image_url'];
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['path'] = path;
    data['url'] = url;
    data['original_image_url'] = originalImageUrl;
    data['small_image_url'] = smallImageUrl;
    data['medium_image_url'] = mediumImageUrl;
    data['large_image_url'] = largeImageUrl;
    return data;
  }
}

class BaseImage {
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String originalImageUrl;

  BaseImage(
      {this.smallImageUrl,
      this.mediumImageUrl,
      this.largeImageUrl,
      this.originalImageUrl});

  BaseImage.fromJson(Map<String, dynamic> json) {
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
    originalImageUrl = json['original_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small_image_url'] = smallImageUrl;
    data['medium_image_url'] = mediumImageUrl;
    data['large_image_url'] = largeImageUrl;
    data['original_image_url'] = originalImageUrl;
    return data;
  }
}

class Reviews {
  int total;
  int totalRating;
  int averageRating;
  List<Percentage> percentage;

  Reviews({this.total, this.totalRating, this.averageRating, this.percentage});

  Reviews.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalRating = json['total_rating'];
    averageRating = json['average_rating'];
    if (json['percentage'] != null) {
      percentage = new List<Null>();
      json['percentage'].forEach((v) {
        percentage.add(new Percentage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = total;
    data['total_rating'] = totalRating;
    data['average_rating'] = averageRating;
    if (percentage != null) {
      data['percentage'] = percentage.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
