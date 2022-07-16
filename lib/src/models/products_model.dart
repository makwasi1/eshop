import 'dart:convert';

class Products {
  List<Data> data;
  Links links;
  Meta meta;

  Products({this.data, this.links, this.meta});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links.toJson();
    }
    if (meta != null) {
      data['meta'] = meta.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
        images.add(Images.fromJson(v));
      });
    }
    baseImage = json['base_image'] != null
        ? BaseImage.fromJson(json['base_image'])
        : null;
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants.add(Variants.fromJson(v));
      });
    }
    inStock = json['in_stock'];
    reviews =
    json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
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


//TODO: REFACTOR THIS ON THE DATA
class Variants {
  int choice;
  int noResponses;

  Variants({this.choice, this.noResponses});

  Variants.fromJson(Map<String, dynamic> json) {
    choice = json['choice_id'];
    noResponses = json['no_responses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['choice_id'] = choice;
    data['no_responses'] = noResponses;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
      percentage = <Percentage>[];
      json['percentage'].forEach((v) {
        percentage.add(Percentage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['total_rating'] = totalRating;
    data['average_rating'] = averageRating;
    if (percentage != null) {
      data['percentage'] = percentage.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


//TODO:REFACTOR THIS BASING ON API RESPONSE
class Percentage {
  int choice;
  int noResponses;

  Percentage({this.choice, this.noResponses});

  Percentage.fromJson(Map<String, dynamic> json) {
    choice = json['choice_id'];
    noResponses = json['no_responses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['choice_id'] = choice;
    data['no_responses'] = noResponses;
    return data;
  }
}

class Links {
  String first;
  String last;
  Null prev;
  Null next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}
