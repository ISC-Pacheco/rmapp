import 'package:meta/meta.dart';
import 'dart:convert';

// final modeloFactura = modeloFacturaFromJson(jsonString);

ModeloFactura modeloFacturaFromJson(String str) =>
    ModeloFactura.fromJson(json.decode(str));

String modeloFacturaToJson(ModeloFactura data) => json.encode(data.toJson());

class ModeloFactura {
  List<Datum> data;

  ModeloFactura({
    required this.data,
  });

  ModeloFactura copyWith({
    List<Datum>? data,
  }) =>
      ModeloFactura(
        data: data ?? this.data,
      );

  factory ModeloFactura.fromJson(Map<String, dynamic> json) => ModeloFactura(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String bienMaterial;
  DateTime fechaDeCompra;
  String precio;

  Datum({
    required this.bienMaterial,
    required this.fechaDeCompra,
    required this.precio,
  });

  Datum copyWith({
    String? bienMaterial,
    DateTime? fechaDeCompra,
    String? precio,
  }) =>
      Datum(
        bienMaterial: bienMaterial ?? this.bienMaterial,
        fechaDeCompra: fechaDeCompra ?? this.fechaDeCompra,
        precio: precio ?? this.precio,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bienMaterial: json["Bien Material"],
        fechaDeCompra: DateTime.parse(json["Fecha de compra"]),
        precio: json["Precio"],
      );

  Map<String, dynamic> toJson() => {
        "Bien Material": bienMaterial,
        "Fecha de compra":
            "${fechaDeCompra.year.toString().padLeft(4, '0')}-${fechaDeCompra.month.toString().padLeft(2, '0')}-${fechaDeCompra.day.toString().padLeft(2, '0')}",
        "Precio": precio,
      };
}
