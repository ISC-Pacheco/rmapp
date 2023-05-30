import 'dart:convert';

List<Datum> facturaGeneralFromJson(String str) =>
    List<Datum>.from(json.decode(str).map((x) => Datum.fromJson(x)));

String facturaGeneralToJson(List<Datum> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toString())));

class Datum {
  String bienMaterial;
  DateTime fechaDeCompra;
  String precio;

  Datum({
    required this.bienMaterial,
    required this.fechaDeCompra,
    required this.precio,
  });

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
