import 'package:json_annotation/json_annotation.dart';

part 'bien.g.dart';

@JsonSerializable()
class Bien {
  Bien();

  late String id;
  late String nombre;
  late String caracteristicas;
  late String num_inventario;
  late String nick;
  late String serie;
  late String costo;
  late String stock;
  late String id_color;
  late String id_tipob;
  late String id_tipoadqui;
  late String fechadqui;
  late String condicion;
  late String id_categoria;
  late String id_provedor;
  late String id_modelo;
  late String id_estado;
  late String id_marca;
  late String created_at;
  late String updated_at;
  late String factura;
  
  factory Bien.fromJson(Map<String,dynamic> json) => _$BienFromJson(json);
  Map<String, dynamic> toJson() => _$BienToJson(this);
}
