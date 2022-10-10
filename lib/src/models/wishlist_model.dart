class WishlistModel {
  List<WishlistItem> data;
  Links links;
  Meta meta;

  WishlistModel({this.data, this.links, this.meta});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<WishlistItem>();
      json['data'].forEach((v) {
        data.add(new WishlistItem.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class WishlistItem {
  int id;
  Product product;
  String createdAt;
  String updatedAt;

  WishlistItem({this.id, this.product, this.createdAt, this.updatedAt});

  WishlistItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Product {
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
  List<Null> variants;
  bool inStock;
  Reviews reviews;
  bool isSaved;
  String createdAt;
  String updatedAt;

  Product(
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

  Product.fromJson(Map<String, dynamic> json) {
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
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    baseImage = json['base_image'] != null
        ? new BaseImage.fromJson(json['base_image'])
        : null;
  
    inStock = json['in_stock'];
    reviews =
        json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
    isSaved = json['is_saved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['url_key'] = this.urlKey;
    data['price'] = this.price;
    data['formated_price'] = this.formatedPrice;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['sku'] = this.sku;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.baseImage != null) {
      data['base_image'] = this.baseImage.toJson();
    }
    if (this.variants != null) {
     
    }
    data['in_stock'] = this.inStock;
    if (this.reviews != null) {
      data['reviews'] = this.reviews.toJson();
    }
    data['is_saved'] = this.isSaved;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['url'] = this.url;
    data['original_image_url'] = this.originalImageUrl;
    data['small_image_url'] = this.smallImageUrl;
    data['medium_image_url'] = this.mediumImageUrl;
    data['large_image_url'] = this.largeImageUrl;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small_image_url'] = this.smallImageUrl;
    data['medium_image_url'] = this.mediumImageUrl;
    data['large_image_url'] = this.largeImageUrl;
    data['original_image_url'] = this.originalImageUrl;
    return data;
  }
}

class Reviews {
  int total;
  int totalRating;
  int averageRating;

  Reviews({this.total, this.totalRating, this.averageRating});

  Reviews.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalRating = json['total_rating'];
    averageRating = json['average_rating'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['total_rating'] = this.totalRating;
    data['average_rating'] = this.averageRating;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
