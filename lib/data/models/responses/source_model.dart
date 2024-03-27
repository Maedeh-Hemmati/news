import 'dart:convert';

import '../../../domain/entities/responses/source.dart';

class SourceModel extends Source {
  const SourceModel({
    String? id,
    String? name,
  }) : super(
          id: id,
          name: name,
        );

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
SourceModel sourceModelFromJson(String str) => SourceModel.fromJson(json.decode(str));

String sourceModelToJson(SourceModel data) => json.encode(data.toJson());