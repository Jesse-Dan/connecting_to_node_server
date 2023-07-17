// To parse this JSON data, do
//
//     final customerDataModel = customerDataModelFromJson(jsonString);

import 'dart:convert';

CustomerDataModel customerDataModelFromJson(String str) => CustomerDataModel.fromJson(json.decode(str));

String customerDataModelToJson(CustomerDataModel data) => json.encode(data.toJson());

class CustomerDataModel {
    List<Datum>? data;

    CustomerDataModel({
        this.data,
    });

    CustomerDataModel copyWith({
        List<Datum>? data,
    }) => 
        CustomerDataModel(
            data: data ?? this.data,
        );

    factory CustomerDataModel.fromJson(Map<String, dynamic> json) => CustomerDataModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? name;
    String? industry;
    int? v;

    Datum({
        this.id,
        this.name,
        this.industry,
        this.v,
    });

    Datum copyWith({
        String? id,
        String? name,
        String? industry,
        int? v,
    }) => 
        Datum(
            id: id ?? this.id,
            name: name ?? this.name,
            industry: industry ?? this.industry,
            v: v ?? this.v,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
