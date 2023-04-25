import 'dart:convert';

List<BienModel> userModelFromJson(String str) =>
    List<BienModel>.from(json.decode(str).map((x) => BienModel.fromJson(x)));

String userModelToJson(List<BienModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BienModel {
  BienModel({
    this.rmId,
    this.rmNombre,
    this.rmDescripcion,
    this.rmCantidad,
    this.rmPrecio,
    this.rmFecha,
    this.rmEstado,
    this.rmImagen,
  });

  String? rmId;
  String? rmNombre;
  String? rmDescripcion;
  String? rmCantidad;
  String? rmPrecio;
  String? rmFecha;
  String? rmEstado;
  String? rmImagen;

  factory BienModel.fromJson(Map<String, dynamic> json) => BienModel(
        rmId: json["rm_id"],
        rmNombre: json["rm_nombre"],
        rmDescripcion: json["rm_descripcion"],
        rmCantidad: json["rm_cantidad"],
        rmPrecio: json["rm_precio"],
        rmFecha: json["rm_fecha"],
        rmEstado: json["rm_estado"],
        rmImagen: json["rm_imagen"],
      );

  Map<String, dynamic> toJson() => {
        "rm_id": rmId,
        "rm_nombre": rmNombre,
        "rm_descripcion": rmDescripcion,
        "rm_cantidad": rmCantidad,
        "rm_precio": rmPrecio,
        "rm_fecha": rmFecha,
        "rm_estado": rmEstado,
        "rm_imagen": rmImagen,
      };
}
