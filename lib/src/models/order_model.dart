class OrderModel {
  List<Order> data;
  Links links;
  Meta meta;

  OrderModel({this.data, this.links, this.meta});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Order>[];
      json['data'].forEach((v) {
        data.add(Order.fromJson(v));
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
    if (links != null) {
      data['links'] = links.toJson();
    }
    if (meta != null) {
      data['meta'] = meta.toJson();
    }
    return data;
  }
}

class Order {
  int id;
  String status;
  String statusLabel;
  String channelName;
  int isGuest;
  String customerEmail;
  String customerFirstName;
  String customerLastName;
  String shippingMethod;
  String shippingTitle;
  String paymentTitle;
  String shippingDescription;
  String couponCode;
  int isGift;
  int totalItemCount;
  int totalQtyOrdered;
  String baseCurrencyCode;
  String channelCurrencyCode;
  String orderCurrencyCode;
  String grandTotal;
  String formatedGrandTotal;
  String baseGrandTotal;
  String formatedBaseGrandTotal;
  String grandTotalInvoiced;
  String formatedGrandTotalInvoiced;
  String baseGrandTotalInvoiced;
  String formatedBaseGrandTotalInvoiced;
  String grandTotalRefunded;
  String formatedGrandTotalRefunded;
  String baseGrandTotalRefunded;
  String formatedBaseGrandTotalRefunded;
  String subTotal;
  String formatedSubTotal;
  String baseSubTotal;
  String formatedBaseSubTotal;
  String subTotalInvoiced;
  String formatedSubTotalInvoiced;
  String baseSubTotalInvoiced;
  String formatedBaseSubTotalInvoiced;
  String subTotalRefunded;
  String formatedSubTotalRefunded;
  String discountPercent;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  String discountInvoiced;
  String formatedDiscountInvoiced;
  String baseDiscountInvoiced;
  String formatedBaseDiscountInvoiced;
  String discountRefunded;
  String formatedDiscountRefunded;
  String baseDiscountRefunded;
  String formatedBaseDiscountRefunded;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String taxAmountInvoiced;
  String formatedTaxAmountInvoiced;
  String baseTaxAmountInvoiced;
  String formatedBaseTaxAmountInvoiced;
  String taxAmountRefunded;
  String formatedTaxAmountRefunded;
  String baseTaxAmountRefunded;
  String formatedBaseTaxAmountRefunded;
  String shippingAmount;
  String formatedShippingAmount;
  String baseShippingAmount;
  String formatedBaseShippingAmount;
  String shippingInvoiced;
  String formatedShippingInvoiced;
  String baseShippingInvoiced;
  String formatedBaseShippingInvoiced;
  String shippingRefunded;
  String formatedShippingRefunded;
  String baseShippingRefunded;
  String formatedBaseShippingRefunded;
  Customer customer;
  Channel channel;
  ShippingAddress shippingAddress;
  ShippingAddress billingAddress;
  String updatedAt;
  List<Items> items;
  List<Invoices> invoices;
  List<Shipments> shipments;
  String createdAt;

  Order(
      {this.id,
      this.status,
      this.statusLabel,
      this.channelName,
      this.isGuest,
      this.customerEmail,
      this.customerFirstName,
      this.customerLastName,
      this.shippingMethod,
      this.shippingTitle,
      this.paymentTitle,
      this.shippingDescription,
      this.couponCode,
      this.isGift,
      this.totalItemCount,
      this.totalQtyOrdered,
      this.baseCurrencyCode,
      this.channelCurrencyCode,
      this.orderCurrencyCode,
      this.grandTotal,
      this.formatedGrandTotal,
      this.baseGrandTotal,
      this.formatedBaseGrandTotal,
      this.grandTotalInvoiced,
      this.formatedGrandTotalInvoiced,
      this.baseGrandTotalInvoiced,
      this.formatedBaseGrandTotalInvoiced,
      this.grandTotalRefunded,
      this.formatedGrandTotalRefunded,
      this.baseGrandTotalRefunded,
      this.formatedBaseGrandTotalRefunded,
      this.subTotal,
      this.formatedSubTotal,
      this.baseSubTotal,
      this.formatedBaseSubTotal,
      this.subTotalInvoiced,
      this.formatedSubTotalInvoiced,
      this.baseSubTotalInvoiced,
      this.formatedBaseSubTotalInvoiced,
      this.subTotalRefunded,
      this.formatedSubTotalRefunded,
      this.discountPercent,
      this.discountAmount,
      this.formatedDiscountAmount,
      this.baseDiscountAmount,
      this.formatedBaseDiscountAmount,
      this.discountInvoiced,
      this.formatedDiscountInvoiced,
      this.baseDiscountInvoiced,
      this.formatedBaseDiscountInvoiced,
      this.discountRefunded,
      this.formatedDiscountRefunded,
      this.baseDiscountRefunded,
      this.formatedBaseDiscountRefunded,
      this.taxAmount,
      this.formatedTaxAmount,
      this.baseTaxAmount,
      this.formatedBaseTaxAmount,
      this.taxAmountInvoiced,
      this.formatedTaxAmountInvoiced,
      this.baseTaxAmountInvoiced,
      this.formatedBaseTaxAmountInvoiced,
      this.taxAmountRefunded,
      this.formatedTaxAmountRefunded,
      this.baseTaxAmountRefunded,
      this.formatedBaseTaxAmountRefunded,
      this.shippingAmount,
      this.formatedShippingAmount,
      this.baseShippingAmount,
      this.formatedBaseShippingAmount,
      this.shippingInvoiced,
      this.formatedShippingInvoiced,
      this.baseShippingInvoiced,
      this.formatedBaseShippingInvoiced,
      this.shippingRefunded,
      this.formatedShippingRefunded,
      this.baseShippingRefunded,
      this.formatedBaseShippingRefunded,
      this.customer,
      this.channel,
      this.shippingAddress,
      this.billingAddress,
      this.updatedAt,
      this.items,
      this.invoices,
      this.shipments,
      this.createdAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    statusLabel = json['status_label'];
    channelName = json['channel_name'];
    isGuest = json['is_guest'];
    customerEmail = json['customer_email'];
    customerFirstName = json['customer_first_name'];
    customerLastName = json['customer_last_name'];
    shippingMethod = json['shipping_method'];
    shippingTitle = json['shipping_title'];
    paymentTitle = json['payment_title'];
    shippingDescription = json['shipping_description'];
    couponCode = json['coupon_code'];
    isGift = json['is_gift'];
    totalItemCount = json['total_item_count'];
    totalQtyOrdered = json['total_qty_ordered'];
    baseCurrencyCode = json['base_currency_code'];
    channelCurrencyCode = json['channel_currency_code'];
    orderCurrencyCode = json['order_currency_code'];
    grandTotal = json['grand_total'];
    formatedGrandTotal = json['formated_grand_total'];
    baseGrandTotal = json['base_grand_total'];
    formatedBaseGrandTotal = json['formated_base_grand_total'];
    grandTotalInvoiced = json['grand_total_invoiced'];
    formatedGrandTotalInvoiced = json['formated_grand_total_invoiced'];
    baseGrandTotalInvoiced = json['base_grand_total_invoiced'];
    formatedBaseGrandTotalInvoiced = json['formated_base_grand_total_invoiced'];
    grandTotalRefunded = json['grand_total_refunded'];
    formatedGrandTotalRefunded = json['formated_grand_total_refunded'];
    baseGrandTotalRefunded = json['base_grand_total_refunded'];
    formatedBaseGrandTotalRefunded = json['formated_base_grand_total_refunded'];
    subTotal = json['sub_total'];
    formatedSubTotal = json['formated_sub_total'];
    baseSubTotal = json['base_sub_total'];
    formatedBaseSubTotal = json['formated_base_sub_total'];
    subTotalInvoiced = json['sub_total_invoiced'];
    formatedSubTotalInvoiced = json['formated_sub_total_invoiced'];
    baseSubTotalInvoiced = json['base_sub_total_invoiced'];
    formatedBaseSubTotalInvoiced = json['formated_base_sub_total_invoiced'];
    subTotalRefunded = json['sub_total_refunded'];
    formatedSubTotalRefunded = json['formated_sub_total_refunded'];
    discountPercent = json['discount_percent'];
    discountAmount = json['discount_amount'];
    formatedDiscountAmount = json['formated_discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    formatedBaseDiscountAmount = json['formated_base_discount_amount'];
    discountInvoiced = json['discount_invoiced'];
    formatedDiscountInvoiced = json['formated_discount_invoiced'];
    baseDiscountInvoiced = json['base_discount_invoiced'];
    formatedBaseDiscountInvoiced = json['formated_base_discount_invoiced'];
    discountRefunded = json['discount_refunded'];
    formatedDiscountRefunded = json['formated_discount_refunded'];
    baseDiscountRefunded = json['base_discount_refunded'];
    formatedBaseDiscountRefunded = json['formated_base_discount_refunded'];
    taxAmount = json['tax_amount'];
    formatedTaxAmount = json['formated_tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    formatedBaseTaxAmount = json['formated_base_tax_amount'];
    taxAmountInvoiced = json['tax_amount_invoiced'];
    formatedTaxAmountInvoiced = json['formated_tax_amount_invoiced'];
    baseTaxAmountInvoiced = json['base_tax_amount_invoiced'];
    formatedBaseTaxAmountInvoiced = json['formated_base_tax_amount_invoiced'];
    taxAmountRefunded = json['tax_amount_refunded'];
    formatedTaxAmountRefunded = json['formated_tax_amount_refunded'];
    baseTaxAmountRefunded = json['base_tax_amount_refunded'];
    formatedBaseTaxAmountRefunded = json['formated_base_tax_amount_refunded'];
    shippingAmount = json['shipping_amount'];
    formatedShippingAmount = json['formated_shipping_amount'];
    baseShippingAmount = json['base_shipping_amount'];
    formatedBaseShippingAmount = json['formated_base_shipping_amount'];
    shippingInvoiced = json['shipping_invoiced'];
    formatedShippingInvoiced = json['formated_shipping_invoiced'];
    baseShippingInvoiced = json['base_shipping_invoiced'];
    formatedBaseShippingInvoiced = json['formated_base_shipping_invoiced'];
    shippingRefunded = json['shipping_refunded'];
    formatedShippingRefunded = json['formated_shipping_refunded'];
    baseShippingRefunded = json['base_shipping_refunded'];
    formatedBaseShippingRefunded = json['formated_base_shipping_refunded'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    channel =
        json['channel'] != null ? new Channel.fromJson(json['channel']) : null;
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
    billingAddress = json['billing_address'] != null
        ? new ShippingAddress.fromJson(json['billing_address'])
        : null;
    updatedAt = json['updated_at'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    if (json['invoices'] != null) {
      invoices = <Invoices>[];
      json['invoices'].forEach((v) {
        invoices.add(new Invoices.fromJson(v));
      });
    }
    if (json['shipments'] != null) {
      shipments = <Shipments>[];
      json['shipments'].forEach((v) {
        shipments.add(new Shipments.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['status'] = status;
    data['status_label'] = statusLabel;
    data['channel_name'] = channelName;
    data['is_guest'] = isGuest;
    data['customer_email'] = customerEmail;
    data['customer_first_name'] = customerFirstName;
    data['customer_last_name'] = customerLastName;
    data['shipping_method'] = shippingMethod;
    data['shipping_title'] = shippingTitle;
    data['payment_title'] = paymentTitle;
    data['shipping_description'] = shippingDescription;
    data['coupon_code'] = couponCode;
    data['is_gift'] = isGift;
    data['total_item_count'] = totalItemCount;
    data['total_qty_ordered'] = totalQtyOrdered;
    data['base_currency_code'] = baseCurrencyCode;
    data['channel_currency_code'] = channelCurrencyCode;
    data['order_currency_code'] = orderCurrencyCode;
    data['grand_total'] = grandTotal;
    data['formated_grand_total'] = formatedGrandTotal;
    data['base_grand_total'] = baseGrandTotal;
    data['formated_base_grand_total'] = formatedBaseGrandTotal;
    data['grand_total_invoiced'] = grandTotalInvoiced;
    data['formated_grand_total_invoiced'] = formatedGrandTotalInvoiced;
    data['base_grand_total_invoiced'] = baseGrandTotalInvoiced;
    data['formated_base_grand_total_invoiced'] =
        formatedBaseGrandTotalInvoiced;
    data['grand_total_refunded'] = grandTotalRefunded;
    data['formated_grand_total_refunded'] = formatedGrandTotalRefunded;
    data['base_grand_total_refunded'] = baseGrandTotalRefunded;
    data['formated_base_grand_total_refunded'] =
        formatedBaseGrandTotalRefunded;
    data['sub_total'] = subTotal;
    data['formated_sub_total'] = formatedSubTotal;
    data['base_sub_total'] = baseSubTotal;
    data['formated_base_sub_total'] = formatedBaseSubTotal;
    data['sub_total_invoiced'] = subTotalInvoiced;
    data['formated_sub_total_invoiced'] = formatedSubTotalInvoiced;
    data['base_sub_total_invoiced'] = baseSubTotalInvoiced;
    data['formated_base_sub_total_invoiced'] =
        formatedBaseSubTotalInvoiced;
    data['sub_total_refunded'] = subTotalRefunded;
    data['formated_sub_total_refunded'] = formatedSubTotalRefunded;
    data['discount_percent'] = discountPercent;
    data['discount_amount'] = discountAmount;
    data['formated_discount_amount'] = formatedDiscountAmount;
    data['base_discount_amount'] = baseDiscountAmount;
    data['formated_base_discount_amount'] = formatedBaseDiscountAmount;
    data['discount_invoiced'] = discountInvoiced;
    data['formated_discount_invoiced'] = formatedDiscountInvoiced;
    data['base_discount_invoiced'] = baseDiscountInvoiced;
    data['formated_base_discount_invoiced'] = formatedBaseDiscountInvoiced;
    data['discount_refunded'] = discountRefunded;
    data['formated_discount_refunded'] = formatedDiscountRefunded;
    data['base_discount_refunded'] = baseDiscountRefunded;
    data['formated_base_discount_refunded'] = formatedBaseDiscountRefunded;
    data['tax_amount'] = taxAmount;
    data['formated_tax_amount'] = formatedTaxAmount;
    data['base_tax_amount'] = baseTaxAmount;
    data['formated_base_tax_amount'] = formatedBaseTaxAmount;
    data['tax_amount_invoiced'] = taxAmountInvoiced;
    data['formated_tax_amount_invoiced'] = formatedTaxAmountInvoiced;
    data['base_tax_amount_invoiced'] = baseTaxAmountInvoiced;
    data['formated_base_tax_amount_invoiced'] =
        formatedBaseTaxAmountInvoiced;
    data['tax_amount_refunded'] = taxAmountRefunded;
    data['formated_tax_amount_refunded'] = formatedTaxAmountRefunded;
    data['base_tax_amount_refunded'] = baseTaxAmountRefunded;
    data['formated_base_tax_amount_refunded'] =
        formatedBaseTaxAmountRefunded;
    data['shipping_amount'] = shippingAmount;
    data['formated_shipping_amount'] = formatedShippingAmount;
    data['base_shipping_amount'] = baseShippingAmount;
    data['formated_base_shipping_amount'] = formatedBaseShippingAmount;
    data['shipping_invoiced'] = shippingInvoiced;
    data['formated_shipping_invoiced'] = formatedShippingInvoiced;
    data['base_shipping_invoiced'] = baseShippingInvoiced;
    data['formated_base_shipping_invoiced'] = formatedBaseShippingInvoiced;
    data['shipping_refunded'] = shippingRefunded;
    data['formated_shipping_refunded'] = formatedShippingRefunded;
    data['base_shipping_refunded'] = baseShippingRefunded;
    data['formated_base_shipping_refunded'] = formatedBaseShippingRefunded;
    if (customer != null) {
      data['customer'] = customer.toJson();
    }
    if (channel != null) {
      data['channel'] = channel.toJson();
    }
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress.toJson();
    }
    if (billingAddress != null) {
      data['billing_address'] = billingAddress.toJson();
    }
    data['updated_at'] = updatedAt;
    if (items != null) {
      data['items'] = items.map((v) => v.toJson()).toList();
    }
    if (invoices != null) {
      data['invoices'] = invoices.map((v) => v.toJson()).toList();
    }
    if (shipments != null) {
      data['shipments'] = shipments.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    return data;
  }
}

class Customer {
  int id;
  String email;
  String firstName;
  String lastName;
  String name;
  String gender;
  String dateOfBirth;
  String phone;
  int status;
  Group group;
  String createdAt;
  String updatedAt;

  Customer(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.name,
      this.gender,
      this.dateOfBirth,
      this.phone,
      this.status,
      this.group,
      this.createdAt,
      this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    phone = json['phone'];
    status = json['status'];
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['name'] = name;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['phone'] = phone;
    data['status'] = status;
    if (group != null) {
      data['group'] = group.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Group {
  int id;
  String name;
  String createdAt;
  String updatedAt;

  Group({this.id, this.name, this.createdAt, this.updatedAt});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Channel {
  int id;
  String code;
  String name;
  String description;
 
  String theme;
  String homePageContent;
  String footerContent;
  String hostname;
  String logo;
  String logoUrl;
  String favicon;
  String faviconUrl;
  DefaultLocale defaultLocale;
  int rootCategoryId;
  RootCategory rootCategory;
  String createdAt;
  String updatedAt;

  Channel(
      {this.id,
      this.code,
      this.name,
      this.description,
    
      this.theme,
      this.homePageContent,
      this.footerContent,
      this.hostname,
      this.logo,
      this.logoUrl,
      this.favicon,
      this.faviconUrl,
      this.defaultLocale,
      this.rootCategoryId,
      this.rootCategory,
      this.createdAt,
      this.updatedAt});

  Channel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
   
    theme = json['theme'];
    homePageContent = json['home_page_content'];
    footerContent = json['footer_content'];
    hostname = json['hostname'];
    logo = json['logo'];
    logoUrl = json['logo_url'];
    favicon = json['favicon'];
    faviconUrl = json['favicon_url'];
    defaultLocale = json['default_locale'] != null
        ? new DefaultLocale.fromJson(json['default_locale'])
        : null;
    rootCategoryId = json['root_category_id'];
    rootCategory = json['root_category'] != null
        ? new RootCategory.fromJson(json['root_category'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['description'] = description;

    data['theme'] = theme;
    data['home_page_content'] = homePageContent;
    data['footer_content'] = footerContent;
    data['hostname'] = hostname;
    data['logo'] = logo;
    data['logo_url'] = logoUrl;
    data['favicon'] = favicon;
    data['favicon_url'] = faviconUrl;
    if (defaultLocale != null) {
      data['default_locale'] = defaultLocale.toJson();
    }
    data['root_category_id'] = rootCategoryId;
    if (rootCategory != null) {
      data['root_category'] = rootCategory.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class DefaultLocale {
  int id;
  String code;
  String name;
  String createdAt;
  String updatedAt;

  DefaultLocale(
      {this.id, this.code, this.name, this.createdAt, this.updatedAt});

  DefaultLocale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class RootCategory {
  int id;
  String code;
  String name;
  String slug;
  String displayMode;
  String description;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  int status;
  String imageUrl;
  String createdAt;
  String updatedAt;

  RootCategory(
      {this.id,
      this.code,
      this.name,
      this.slug,
      this.displayMode,
      this.description,
      this.metaTitle,
      this.metaDescription,
      this.metaKeywords,
      this.status,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  RootCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    slug = json['slug'];
    displayMode = json['display_mode'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    status = json['status'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['slug'] = slug;
    data['display_mode'] = displayMode;
    data['description'] = description;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['status'] = status;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ShippingAddress {
  int id;
  String email;
  String firstName;
  String lastName;
  List<String> address1;
  String country;
  String countryName;
  String state;
  String city;
  String postcode;
  String phone;
  String createdAt;
  String updatedAt;

  ShippingAddress(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.address1,
      this.country,
      this.countryName,
      this.state,
      this.city,
      this.postcode,
      this.phone,
      this.createdAt,
      this.updatedAt});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address1 = json['address1'].cast<String>();
    country = json['country'];
    countryName = json['country_name'];
    state = json['state'];
    city = json['city'];
    postcode = json['postcode'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['address1'] = address1;
    data['country'] = country;
    data['country_name'] = countryName;
    data['state'] = state;
    data['city'] = city;
    data['postcode'] = postcode;
    data['phone'] = phone;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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


  Reviews({this.total, this.totalRating, this.averageRating});

  Reviews.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalRating = json['total_rating'];
    averageRating = json['average_rating'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = total;
    data['total_rating'] = totalRating;
    data['average_rating'] = averageRating;
    
    return data;
  }
}



class Invoices {
  int id;
  String state;
  int emailSent;
  int totalQty;
  String baseCurrencyCode;
  String channelCurrencyCode;
  String orderCurrencyCode;
  String subTotal;
  String formatedSubTotal;
  String baseSubTotal;
  String formatedBaseSubTotal;
  String grandTotal;
  String formatedGrandTotal;
  String baseGrandTotal;
  String formatedBaseGrandTotal;
  String shippingAmount;
  String formatedShippingAmount;
  String baseShippingAmount;
  String formatedBaseShippingAmount;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  ShippingAddress orderAddress;
  String transactionId;
  List<Items> items;
  String createdAt;

  Invoices(
      {this.id,
      this.state,
      this.emailSent,
      this.totalQty,
      this.baseCurrencyCode,
      this.channelCurrencyCode,
      this.orderCurrencyCode,
      this.subTotal,
      this.formatedSubTotal,
      this.baseSubTotal,
      this.formatedBaseSubTotal,
      this.grandTotal,
      this.formatedGrandTotal,
      this.baseGrandTotal,
      this.formatedBaseGrandTotal,
      this.shippingAmount,
      this.formatedShippingAmount,
      this.baseShippingAmount,
      this.formatedBaseShippingAmount,
      this.taxAmount,
      this.formatedTaxAmount,
      this.baseTaxAmount,
      this.formatedBaseTaxAmount,
      this.discountAmount,
      this.formatedDiscountAmount,
      this.baseDiscountAmount,
      this.formatedBaseDiscountAmount,
      this.orderAddress,
      this.transactionId,
      this.items,
      this.createdAt});

  Invoices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    emailSent = json['email_sent'];
    totalQty = json['total_qty'];
    baseCurrencyCode = json['base_currency_code'];
    channelCurrencyCode = json['channel_currency_code'];
    orderCurrencyCode = json['order_currency_code'];
    subTotal = json['sub_total'];
    formatedSubTotal = json['formated_sub_total'];
    baseSubTotal = json['base_sub_total'];
    formatedBaseSubTotal = json['formated_base_sub_total'];
    grandTotal = json['grand_total'];
    formatedGrandTotal = json['formated_grand_total'];
    baseGrandTotal = json['base_grand_total'];
    formatedBaseGrandTotal = json['formated_base_grand_total'];
    shippingAmount = json['shipping_amount'];
    formatedShippingAmount = json['formated_shipping_amount'];
    baseShippingAmount = json['base_shipping_amount'];
    formatedBaseShippingAmount = json['formated_base_shipping_amount'];
    taxAmount = json['tax_amount'];
    formatedTaxAmount = json['formated_tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    formatedBaseTaxAmount = json['formated_base_tax_amount'];
    discountAmount = json['discount_amount'];
    formatedDiscountAmount = json['formated_discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    formatedBaseDiscountAmount = json['formated_base_discount_amount'];
    orderAddress = json['order_address'] != null
        ? new ShippingAddress.fromJson(json['order_address'])
        : null;
    transactionId = json['transaction_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['state'] = state;
    data['email_sent'] = emailSent;
    data['total_qty'] = totalQty;
    data['base_currency_code'] = baseCurrencyCode;
    data['channel_currency_code'] = channelCurrencyCode;
    data['order_currency_code'] = orderCurrencyCode;
    data['sub_total'] = subTotal;
    data['formated_sub_total'] = formatedSubTotal;
    data['base_sub_total'] = baseSubTotal;
    data['formated_base_sub_total'] = formatedBaseSubTotal;
    data['grand_total'] = grandTotal;
    data['formated_grand_total'] = formatedGrandTotal;
    data['base_grand_total'] = baseGrandTotal;
    data['formated_base_grand_total'] = formatedBaseGrandTotal;
    data['shipping_amount'] = shippingAmount;
    data['formated_shipping_amount'] = formatedShippingAmount;
    data['base_shipping_amount'] = baseShippingAmount;
    data['formated_base_shipping_amount'] = formatedBaseShippingAmount;
    data['tax_amount'] = taxAmount;
    data['formated_tax_amount'] = formatedTaxAmount;
    data['base_tax_amount'] = baseTaxAmount;
    data['formated_base_tax_amount'] = formatedBaseTaxAmount;
    data['discount_amount'] = discountAmount;
    data['formated_discount_amount'] = formatedDiscountAmount;
    data['base_discount_amount'] = baseDiscountAmount;
    data['formated_base_discount_amount'] = formatedBaseDiscountAmount;
    if (orderAddress != null) {
      data['order_address'] = orderAddress.toJson();
    }
    data['transaction_id'] = transactionId;
    if (items != null) {
      data['items'] = items.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    return data;
  }
}





class Shipments {
  int id;
  String status;
  int totalQty;
  String totalWeight;
  String carrierCode;
  String carrierTitle;
  String trackNumber;
  int emailSent;
  Customer customer;
  InventorySource inventorySource;
  List<Items> items;

  Shipments(
      {this.id,
      this.status,
      this.totalQty,
      this.totalWeight,
      this.carrierCode,
      this.carrierTitle,
      this.trackNumber,
      this.emailSent,
      this.customer,
      this.inventorySource,
      this.items});

  Shipments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    totalQty = json['total_qty'];
    totalWeight = json['total_weight'];
    carrierCode = json['carrier_code'];
    carrierTitle = json['carrier_title'];
    trackNumber = json['track_number'];
    emailSent = json['email_sent'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    inventorySource = json['inventory_source'] != null
        ? new InventorySource.fromJson(json['inventory_source'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['status'] = status;
    data['total_qty'] = totalQty;
    data['total_weight'] = totalWeight;
    data['carrier_code'] = carrierCode;
    data['carrier_title'] = carrierTitle;
    data['track_number'] = trackNumber;
    data['email_sent'] = emailSent;
    if (customer != null) {
      data['customer'] = customer.toJson();
    }
    if (inventorySource != null) {
      data['inventory_source'] = inventorySource.toJson();
    }
    if (items != null) {
      data['items'] = items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InventorySource {
  int id;
  String code;
  String name;
  String description;
  String contactName;
  String contactEmail;
  String contactNumber;
  String contactFax;
  String country;
  String state;
  String city;
  String street;
  String postcode;
  int priority;
  String latitude;
  String longitude;
  int status;
  String createdAt;
  String updatedAt;

  InventorySource(
      {this.id,
      this.code,
      this.name,
      this.description,
      this.contactName,
      this.contactEmail,
      this.contactNumber,
      this.contactFax,
      this.country,
      this.state,
      this.city,
      this.street,
      this.postcode,
      this.priority,
      this.latitude,
      this.longitude,
      this.status,
      this.createdAt,
      this.updatedAt});

  InventorySource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    contactName = json['contact_name'];
    contactEmail = json['contact_email'];
    contactNumber = json['contact_number'];
    contactFax = json['contact_fax'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    street = json['street'];
    postcode = json['postcode'];
    priority = json['priority'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['description'] = description;
    data['contact_name'] = contactName;
    data['contact_email'] = contactEmail;
    data['contact_number'] = contactNumber;
    data['contact_fax'] = contactFax;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['street'] = street;
    data['postcode'] = postcode;
    data['priority'] = priority;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Items {
  int id;
  String name;
  String description;
  String sku;
  int qty;

  String price;
  String formatedPrice;
  String basePrice;
  String formatedBasePrice;
  String total;
  String formatedTotal;
  String baseTotal;
  String formatedBaseTotal;


  Items(
      {this.id,
      this.name,
      this.description,
      this.sku,
      this.qty,
     
      this.price,
      this.formatedPrice,
      this.basePrice,
      this.formatedBasePrice,
      this.total,
      this.formatedTotal,
      this.baseTotal,
      this.formatedBaseTotal,
      });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sku = json['sku'];
    qty = json['qty'];
    
    price = json['price'];
    formatedPrice = json['formated_price'];
    basePrice = json['base_price'];
    formatedBasePrice = json['formated_base_price'];
    total = json['total'];
    formatedTotal = json['formated_total'];
    baseTotal = json['base_total'];
    formatedBaseTotal = json['formated_base_total'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['sku'] = sku;
    data['qty'] = qty;
 
    data['price'] = price;
    data['formated_price'] = formatedPrice;
    data['base_price'] = basePrice;
    data['formated_base_price'] = formatedBasePrice;
    data['total'] = total;
    data['formated_total'] = formatedTotal;
    data['base_total'] = baseTotal;
    data['formated_base_total'] = formatedBaseTotal;
    
    return data;
  }
}

class Links {
  String first;
  String last;
  String prev;
  String next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
