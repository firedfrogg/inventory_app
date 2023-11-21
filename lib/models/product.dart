// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String model;
  int pk;
  Fields fields;

  Welcome({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  String season;
  String favorableWeather;
  int price;
  String description;
  int amount;
  DateTime dateAdded;

  Fields({
    required this.user,
    required this.name,
    required this.season,
    required this.favorableWeather,
    required this.price,
    required this.description,
    required this.amount,
    required this.dateAdded,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        season: json["season"],
        favorableWeather: json["favorable_weather"],
        price: json["price"],
        description: json["description"],
        amount: json["amount"],
        dateAdded: DateTime.parse(json["date_added"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "season": season,
        "favorable_weather": favorableWeather,
        "price": price,
        "description": description,
        "amount": amount,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
      };
}
