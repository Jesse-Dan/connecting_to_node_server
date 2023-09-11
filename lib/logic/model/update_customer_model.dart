// To parse this JSON data, do
//
//     final updateCustomersModel = updateCustomersModelFromJson(jsonString);

import 'dart:convert';

UpdateCustomersModel updateCustomersModelFromJson(String str) =>
    UpdateCustomersModel.fromJson(json.decode(str));

String updateCustomersModelToJson(UpdateCustomersModel data) =>
    json.encode(data.toJson());

class UpdateCustomersModel {
  String? id;
  String? name;
  String? industry;
  String? v;

  UpdateCustomersModel({
    this.id,
    this.name,
    this.industry,
    this.v,
  });

  UpdateCustomersModel copyWith({
    String? id,
    String? name,
    String? industry,
    String? v,
  }) =>
      UpdateCustomersModel(
        id: id ?? this.id,
        name: name ?? this.name,
        industry: industry ?? this.industry,
        v: v ?? this.v,
      );

  factory UpdateCustomersModel.fromJson(Map<String, dynamic> json) =>
      UpdateCustomersModel(
        id: json["_id"],
        name: json["name"],
        industry: json["industry"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "industry": industry,
        "__v": v,
      };
}
