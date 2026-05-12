// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  String? name;
  String? capital;

  CountryModel({
    this.name,
    this.capital,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    name: json["name"],
    capital: json["capital"],
  );

  static List<CountryModel> fromList(List<dynamic> list){
    return list.where((e) => (e["capital"] != null))
        .map((element) => CountryModel.fromJson(element))
        .toList();
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "capital": capital,
  };
}
