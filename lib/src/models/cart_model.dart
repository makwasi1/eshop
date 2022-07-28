// class CartModal {
//   String image;
//   String title;
//   String desc;
//   double price;
//   int quantity;
//
//   CartModal({this.image, this.title, this.desc, this.price, this.quantity});
//
//   CartModal.fromJson(Map<String, dynamic> json) {
//     image = json['image'];
//     title = json['title'];
//     desc = json['desc'];
//     price = json['price'];
//     quantity = json['quantity'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['image'] = image;
//     data['title'] = title;
//     data['desc'] = desc;
//     data['price'] = price;
//     data['quantity'] = quantity;
//     return data;
//   }
// }

import 'package:eshop/src/models/products_model.dart';

class CartModel {
  String message;
  Cart data;

  CartModel({this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Cart.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Cart {
  int id;
  String customerEmail;
  String customerFirstName;
  String customerLastName;
  String shippingMethod;
  String couponCode;
  int isGift;
  int itemsCount;
  String itemsQty;
  String exchangeRate;
  String globalCurrencyCode;
  String baseCurrencyCode;
  String channelCurrencyCode;
  String cartCurrencyCode;
  String grandTotal;
  String formatedGrandTotal;
  String baseGrandTotal;
  String formatedBaseGrandTotal;
  String subTotal;
  String formatedSubTotal;
  String baseSubTotal;
  String formatedBaseSubTotal;
  String taxTotal;
  String formatedTaxTotal;
  String baseTaxTotal;
  String formatedBaseTaxTotal;
  String discount;
  String formatedDiscount;
  String baseDiscount;
  String formatedBaseDiscount;
  String checkoutMethod;
  int isGuest;
  int isActive;
  String conversionTime;
  String channel;
  List<Items> items;
  String selectedShippingRate;
  String payment;
  String billingAddress;
  String shippingAddress;
  String createdAt;
  String updatedAt;
  String taxes;
  String formatedTaxes;
  String baseTaxes;
  String formatedBaseTaxes;

  Cart(
      {this.id,
        this.customerEmail,
        this.customerFirstName,
        this.customerLastName,
        this.shippingMethod,
        this.couponCode,
        this.isGift,
        this.itemsCount,
        this.itemsQty,
        this.exchangeRate,
        this.globalCurrencyCode,
        this.baseCurrencyCode,
        this.channelCurrencyCode,
        this.cartCurrencyCode,
        this.grandTotal,
        this.formatedGrandTotal,
        this.baseGrandTotal,
        this.formatedBaseGrandTotal,
        this.subTotal,
        this.formatedSubTotal,
        this.baseSubTotal,
        this.formatedBaseSubTotal,
        this.taxTotal,
        this.formatedTaxTotal,
        this.baseTaxTotal,
        this.formatedBaseTaxTotal,
        this.discount,
        this.formatedDiscount,
        this.baseDiscount,
        this.formatedBaseDiscount,
        this.checkoutMethod,
        this.isGuest,
        this.isActive,
        this.conversionTime,
        this.channel,
        this.items,
        this.selectedShippingRate,
        this.payment,
        this.billingAddress,
        this.shippingAddress,
        this.createdAt,
        this.updatedAt,
        this.taxes,
        this.formatedTaxes,
        this.baseTaxes,
        this.formatedBaseTaxes});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerEmail = json['customer_email'];
    customerFirstName = json['customer_first_name'];
    customerLastName = json['customer_last_name'];
    shippingMethod = json['shipping_method'];
    couponCode = json['coupon_code'];
    isGift = json['is_gift'];
    itemsCount = json['items_count'];
    itemsQty = json['items_qty'];
    exchangeRate = json['exchange_rate'];
    globalCurrencyCode = json['global_currency_code'];
    baseCurrencyCode = json['base_currency_code'];
    channelCurrencyCode = json['channel_currency_code'];
    cartCurrencyCode = json['cart_currency_code'];
    grandTotal = json['grand_total'];
    formatedGrandTotal = json['formated_grand_total'];
    baseGrandTotal = json['base_grand_total'];
    formatedBaseGrandTotal = json['formated_base_grand_total'];
    subTotal = json['sub_total'];
    formatedSubTotal = json['formated_sub_total'];
    baseSubTotal = json['base_sub_total'];
    formatedBaseSubTotal = json['formated_base_sub_total'];
    taxTotal = json['tax_total'];
    formatedTaxTotal = json['formated_tax_total'];
    baseTaxTotal = json['base_tax_total'];
    formatedBaseTaxTotal = json['formated_base_tax_total'];
    discount = json['discount'];
    formatedDiscount = json['formated_discount'];
    baseDiscount = json['base_discount'];
    formatedBaseDiscount = json['formated_base_discount'];
    checkoutMethod = json['checkout_method'];
    isGuest = json['is_guest'];
    isActive = json['is_active'];
    conversionTime = json['conversion_time'];
    channel = json['channel'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(Items.fromJson(v));
      });
    }
    selectedShippingRate = json['selected_shipping_rate'];
    payment = json['payment'];
    billingAddress = json['billing_address'];
    shippingAddress = json['shipping_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxes = json['taxes'];
    formatedTaxes = json['formated_taxes'];
    baseTaxes = json['base_taxes'];
    formatedBaseTaxes = json['formated_base_taxes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_email'] = customerEmail;
    data['customer_first_name'] = customerFirstName;
    data['customer_last_name'] = customerLastName;
    data['shipping_method'] = shippingMethod;
    data['coupon_code'] = couponCode;
    data['is_gift'] = isGift;
    data['items_count'] = itemsCount;
    data['items_qty'] = itemsQty;
    data['exchange_rate'] = exchangeRate;
    data['global_currency_code'] = globalCurrencyCode;
    data['base_currency_code'] = baseCurrencyCode;
    data['channel_currency_code'] = channelCurrencyCode;
    data['cart_currency_code'] = cartCurrencyCode;
    data['grand_total'] = grandTotal;
    data['formated_grand_total'] = formatedGrandTotal;
    data['base_grand_total'] = baseGrandTotal;
    data['formated_base_grand_total'] = formatedBaseGrandTotal;
    data['sub_total'] = subTotal;
    data['formated_sub_total'] = formatedSubTotal;
    data['base_sub_total'] = baseSubTotal;
    data['formated_base_sub_total'] = formatedBaseSubTotal;
    data['tax_total'] = taxTotal;
    data['formated_tax_total'] = formatedTaxTotal;
    data['base_tax_total'] = baseTaxTotal;
    data['formated_base_tax_total'] = formatedBaseTaxTotal;
    data['discount'] = discount;
    data['formated_discount'] = formatedDiscount;
    data['base_discount'] = baseDiscount;
    data['formated_base_discount'] = formatedBaseDiscount;
    data['checkout_method'] = checkoutMethod;
    data['is_guest'] = isGuest;
    data['is_active'] = isActive;
    data['conversion_time'] = conversionTime;
    data['channel'] = channel;
    if (items != null) {
      data['items'] = items.map((v) => v.toJson()).toList();
    }
    data['selected_shipping_rate'] = selectedShippingRate;
    data['payment'] = payment;
    data['billing_address'] = billingAddress;
    data['shipping_address'] = shippingAddress;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['taxes'] = taxes;
    data['formated_taxes'] = formatedTaxes;
    data['base_taxes'] = baseTaxes;
    data['formated_base_taxes'] = formatedBaseTaxes;
    return data;
  }
}

class Items {
  int id;
  int quantity;
  String sku;
  String type;
  String name;
  String couponCode;
  String weight;
  String totalWeight;
  String baseTotalWeight;
  String price;
  String formatedPrice;
  String basePrice;
  String formatedBasePrice;
  String customPrice;
  String formatedCustomPrice;
  String total;
  String formatedTotal;
  String baseTotal;
  String formatedBaseTotal;
  String taxPercent;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String discountPercent;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  Additional additional;
  String child;
  Product product;
  String createdAt;
  String updatedAt;

  Items(
      {this.id,
        this.quantity,
        this.sku,
        this.type,
        this.name,
        this.couponCode,
        this.weight,
        this.totalWeight,
        this.baseTotalWeight,
        this.price,
        this.formatedPrice,
        this.basePrice,
        this.formatedBasePrice,
        this.customPrice,
        this.formatedCustomPrice,
        this.total,
        this.formatedTotal,
        this.baseTotal,
        this.formatedBaseTotal,
        this.taxPercent,
        this.taxAmount,
        this.formatedTaxAmount,
        this.baseTaxAmount,
        this.formatedBaseTaxAmount,
        this.discountPercent,
        this.discountAmount,
        this.formatedDiscountAmount,
        this.baseDiscountAmount,
        this.formatedBaseDiscountAmount,
        this.additional,
        this.child,
        this.product,
        this.createdAt,
        this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    sku = json['sku'];
    type = json['type'];
    name = json['name'];
    couponCode = json['coupon_code'];
    weight = json['weight'];
    totalWeight = json['total_weight'];
    baseTotalWeight = json['base_total_weight'];
    price = json['price'];
    formatedPrice = json['formated_price'];
    basePrice = json['base_price'];
    formatedBasePrice = json['formated_base_price'];
    customPrice = json['custom_price'];
    formatedCustomPrice = json['formated_custom_price'];
    total = json['total'];
    formatedTotal = json['formated_total'];
    baseTotal = json['base_total'];
    formatedBaseTotal = json['formated_base_total'];
    taxPercent = json['tax_percent'];
    taxAmount = json['tax_amount'];
    formatedTaxAmount = json['formated_tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    formatedBaseTaxAmount = json['formated_base_tax_amount'];
    discountPercent = json['discount_percent'];
    discountAmount = json['discount_amount'];
    formatedDiscountAmount = json['formated_discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    formatedBaseDiscountAmount = json['formated_base_discount_amount'];
    additional = json['additional'] != null
        ? Additional.fromJson(json['additional'])
        : null;
    child = json['child'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['sku'] = sku;
    data['type'] = type;
    data['name'] = name;
    data['coupon_code'] = couponCode;
    data['weight'] = weight;
    data['total_weight'] = totalWeight;
    data['base_total_weight'] = baseTotalWeight;
    data['price'] = price;
    data['formated_price'] = formatedPrice;
    data['base_price'] = basePrice;
    data['formated_base_price'] = formatedBasePrice;
    data['custom_price'] = customPrice;
    data['formated_custom_price'] = formatedCustomPrice;
    data['total'] = total;
    data['formated_total'] = formatedTotal;
    data['base_total'] = baseTotal;
    data['formated_base_total'] = formatedBaseTotal;
    data['tax_percent'] = taxPercent;
    data['tax_amount'] = taxAmount;
    data['formated_tax_amount'] = formatedTaxAmount;
    data['base_tax_amount'] = baseTaxAmount;
    data['formated_base_tax_amount'] = formatedBaseTaxAmount;
    data['discount_percent'] = discountPercent;
    data['discount_amount'] = discountAmount;
    data['formated_discount_amount'] = formatedDiscountAmount;
    data['base_discount_amount'] = baseDiscountAmount;
    data['formated_base_discount_amount'] = formatedBaseDiscountAmount;
    if (additional != null) {
      data['additional'] = additional.toJson();
    }
    data['child'] = child;
    if (product != null) {
      data['product'] = product.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Additional {
  int quantity;

  Additional({this.quantity});

  Additional.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
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
  List<Variants> variants;
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
      percentage = <Percentage>[];
      json['percentage'].forEach((v) {
        percentage.add(Percentage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['total_rating'] = totalRating;
    data['average_rating'] = averageRating;
    if (percentage != null) {
      data['percentage'] = percentage.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
