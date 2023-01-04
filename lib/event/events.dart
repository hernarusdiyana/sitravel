import 'package:flutter/cupertino.dart';

class Events {
  final String id;
  final String linkLocation;
  final String location;
  final String name;
  final String poster;
  final int price1;
  final int price2;
  final int price3;
  final String description;

  Events({
    required this.id,
    required this.linkLocation,
    required this.location,
    required this.name,
    required this.poster,
    required this.price1,
    required this.price2,
    required this.price3,
    required this.description,
  });

  Events.fromJson(Map<String, Object> json)
      : this(
          id: json["id"] as String,
          linkLocation: json["linkLocation"] as String,
          location: json["location"] as String,
          name: json["name"] as String,
          poster: json["poster"] as String,
          price1: json["price1"] as int,
          price2: json["price2"] as int,
          price3: json["price3"] as int,
          description: json["decription"] as String,
        );
  Map<String, Object> toJson() {
    return {
      "id": this.id,
      "linkLocation": this.id,
      "location": this.location,
      "name": this.name,
      "poster": this.poster,
      "poster": this.poster,
      "price1": this.price1,
      "price2": this.price2,
      "price3": this.price3,
      "description": this.description,
    };
  }
}
