import 'dart:convert';

/*
Para convertir este código JSON usamos:
final BienesModelo = bienesModeloFromJson(jsonString); 
*/

List<BienesModelo> bienesModeloFromJson(String str) => List<BienesModelo>.from(
    json.decode(str).map((x) => BienesModelo.fromJson(x)));

String bienesModeloToJson(List<BienesModelo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BienesModelo {
  BienesModelo({
    required this.id,
    required this.nombre,
    required this.caracteristicas,
    required this.numInventario,
    required this.nick,
    required this.serie,
    required this.costo,
    required this.stock,
    required this.idColor,
    required this.idTipob,
    required this.idTipoadqui,
    required this.fechadqui,
    required this.condicion,
    required this.idCategoria,
    required this.idProvedor,
    required this.idModelo,
    required this.idEstado,
    required this.idMarca,
    required this.createdAt,
    required this.updatedAt,
    required this.factura,
  });

  String id;
  String nombre;
  String caracteristicas;
  String numInventario;
  String nick;
  String serie;
  String costo;
  String stock;
  String idColor;
  String idTipob;
  String idTipoadqui;
  DateTime fechadqui;
  String condicion;
  String idCategoria;
  String idProvedor;
  String idModelo;
  String idEstado;
  String idMarca;
  DateTime createdAt;
  DateTime updatedAt;
  String factura;

  factory BienesModelo.fromJson(Map<String, dynamic> json) => BienesModelo(
        id: json["id"],
        nombre: json["nombre"],
        caracteristicas: json["caracteristicas"],
        numInventario: json["num_inventario"],
        nick: json["nick"],
        serie: json["serie"],
        costo: json["costo"],
        stock: json["stock"],
        idColor: json["id_color"],
        idTipob: json["id_tipob"],
        idTipoadqui: json["id_tipoadqui"],
        fechadqui: DateTime.parse(json["fechadqui"]),
        condicion: json["condicion"],
        idCategoria: json["id_categoria"],
        idProvedor: json["id_provedor"],
        idModelo: json["id_modelo"],
        idEstado: json["id_estado"],
        idMarca: json["id_marca"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        factura: json["factura"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "caracteristicas": caracteristicas,
        "num_inventario": numInventario,
        "nick": nick,
        "serie": serie,
        "costo": costo,
        "stock": stock,
        "id_color": idColor,
        "id_tipob": idTipob,
        "id_tipoadqui": idTipoadqui,
        "fechadqui":
            "${fechadqui.year.toString().padLeft(4, '0')}-${fechadqui.month.toString().padLeft(2, '0')}-${fechadqui.day.toString().padLeft(2, '0')}",
        "condicion": condicion,
        "id_categoria": idCategoria,
        "id_provedor": idProvedor,
        "id_modelo": idModelo,
        "id_estado": idEstado,
        "id_marca": idMarca,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "factura": factura,
      };
}
