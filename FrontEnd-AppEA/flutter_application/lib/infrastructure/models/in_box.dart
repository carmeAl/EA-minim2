// To parse this JSON data, do
//
//     final inBox = inBoxFromJson(jsonString);

import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class InBox {
    String id;
    String idUsuarioOrigen;
    String idUsuarioDestino;
    String asunto;
    String msn;
    DateTime createdAt;
    DateTime updatedAt;

    InBox({
        required this.id,
        required this.idUsuarioOrigen,
        required this.idUsuarioDestino,
        required this.asunto,
        required this.msn,
        required this.createdAt,
        required this.updatedAt,
    });

    factory InBox.fromRawJson(String str) => InBox.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory InBox.fromJson(Map<String, dynamic> json) => InBox(
        id: json["_id"],
        idUsuarioOrigen: json["idUsuarioOrigen"],
        idUsuarioDestino: json["idUsuarioDestino"],
        asunto: json["asunto"],
        msn: json["msn"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "idUsuarioOrigen": idUsuarioOrigen,
        "idUsuarioDestino": idUsuarioDestino,
        "asunto": asunto,
        "msn": msn,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
