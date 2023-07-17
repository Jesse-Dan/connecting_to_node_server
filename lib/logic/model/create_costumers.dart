// To parse this JSON data, do
//
//     final createCustomersModel = createCustomersModelFromJson(jsonString);

import 'dart:convert';

CreateCustomersModel createCustomersModelFromJson(String str) => CreateCustomersModel.fromJson(json.decode(str));

String createCustomersModelToJson(CreateCustomersModel data) => json.encode(data.toJson());

class CreateCustomersModel {
    String? name;
    String? industry;

    CreateCustomersModel({
        this.name,
        this.industry,
    });

    CreateCustomersModel copyWith({
        String? name,
        String? industry,
    }) => 
        CreateCustomersModel(
            name: name ?? this.name,
            industry: industry ?? this.industry,
        );

    factory CreateCustomersModel.fromJson(Map<String, dynamic> json) => CreateCustomersModel(
        name: json["name"],
        industry: json["industry"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "industry": industry,
    };
}
