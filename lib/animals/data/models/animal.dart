// To parse this JSON data, do
//
//     final animal = animalFromJson(jsonString);

import 'dart:convert';

List<Animal> animalFromJson(String str) =>
    List<Animal>.from(json.decode(str).map((x) => Animal.fromJson(x)));

String animalToJson(List<Animal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Animal {
  Animal({
    required this.name,
    required this.latinName,
    required this.animalType,
    this.activeTime,
    this.lengthMin,
    this.lengthMax,
    this.weightMin,
    this.weightMax,
    this.lifespan,
    required this.habitat,
    this.diet,
    this.geoRange,
    required this.imageLink,
    this.id,
  });

  String name;
  String latinName;
  String animalType;
  String? activeTime;
  String? lengthMin;
  String? lengthMax;
  String? weightMin;
  String? weightMax;
  String? lifespan;
  String habitat;
  String? diet;
  String? geoRange;
  String imageLink;
  int? id;

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        name: json["name"],
        latinName: json["latin_name"],
        animalType: json["animal_type"],
        activeTime: json["active_time"],
        lengthMin: json["length_min"],
        lengthMax: json["length_max"],
        weightMin: json["weight_min"],
        weightMax: json["weight_max"],
        lifespan: json["lifespan"],
        habitat: json["habitat"],
        diet: json["diet"],
        geoRange: json["geo_range"],
        imageLink: json["image_link"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "latin_name": latinName,
        "animal_type": animalType,
        "active_time": activeTime,
        "length_min": lengthMin,
        "length_max": lengthMax,
        "weight_min": weightMin,
        "weight_max": weightMax,
        "lifespan": lifespan,
        "habitat": habitat,
        "diet": diet,
        "geo_range": geoRange,
        "image_link": imageLink,
        "id": id,
      };
}
