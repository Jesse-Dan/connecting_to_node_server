// To parse this JSON data, do
//
//     final newCreatedCustomersModel = newCreatedCustomersModelFromJson(jsonString);

import 'dart:convert';

NewCreatedCustomersModel newCreatedCustomersModelFromJson(String str) => NewCreatedCustomersModel.fromJson(json.decode(str));

String newCreatedCustomersModelToJson(NewCreatedCustomersModel data) => json.encode(data.toJson());

class NewCreatedCustomersModel {
    Person? person;

    NewCreatedCustomersModel({
        this.person,
    });

    NewCreatedCustomersModel copyWith({
        Person? person,
    }) => 
        NewCreatedCustomersModel(
            person: person ?? this.person,
        );

    factory NewCreatedCustomersModel.fromJson(Map<String, dynamic> json) => NewCreatedCustomersModel(
        person: json["person"] == null ? null : Person.fromJson(json["person"]),
    );

    Map<String, dynamic> toJson() => {
        "person": person?.toJson(),
    };
}

class Person {
    String? name;
    String? industry;
    String? id;
    int? v;

    Person({
        this.name,
        this.industry,
        this.id,
        this.v,
    });

    Person copyWith({
        String? name,
        String? industry,
        String? id,
        int? v,
    }) => 
        Person(
            name: name ?? this.name,
            industry: industry ?? this.industry,
            id: id ?? this.id,
            v: v ?? this.v,
        );

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        industry: json["industry"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "industry": industry,
        "_id": id,
        "__v": v,
    };
}
