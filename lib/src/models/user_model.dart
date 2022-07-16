// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.token,
        this.message,
        this.data,
    });

    String token;
    String message;
    User data;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        message: json["message"],
        data: User.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "message": message,
        "data": data.toJson(),
    };
}

class User {
    User({
        this.id,
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
        this.updatedAt,
    });

    int id;
    String email;
    String firstName;
    String lastName;
    String name;
    dynamic gender;
    dynamic dateOfBirth;
    dynamic phone;
    int status;
    Group group;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        phone: json["phone"],
        status: json["status"],
        group: Group.fromJson(json["group"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "phone": phone,
        "status": status,
        "group": group.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Group {
    Group({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    dynamic createdAt;
    dynamic updatedAt;

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
