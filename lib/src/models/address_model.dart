// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
    Address({
        this.address1,
        this.city,
        this.country,
        this.countryName,
        this.phone,
        this.postcode,
        this.state,
        this.id,
    });

    List<String> address1;
    String city;
    String country;
    String countryName;
    String phone;
    String postcode;
    String state;
    int id;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        address1: List<String>.from(json["address1"].map((x) => x)),
        city: json["city"],
        country: json["country"],
        countryName: json["country_name"],
        phone: json["phone"],
        postcode: json["postcode"],
        state: json["state"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "address1": List<dynamic>.from(address1.map((x) => x)),
        "city": city,
        "country": country,
        "country_name": countryName,
        "phone": phone,
        "postcode": postcode,
        "state": state,
        "id": id,
    };
}
