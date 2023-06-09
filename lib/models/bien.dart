import 'package:json_annotation/json_annotation.dart';

part 'bien.g.dart';

@JsonSerializable()
class Bien {
  Bien();

  late String id;
  late String inventario;
  late String descripcion_bien;
  late String caracteristicas;
  late String resguardatorio;
  late String nick;
  late String areas;
  late String ubicacion;
  late String valor;
  late String anotacion;
  
  factory Bien.fromJson(Map<String,dynamic> json) => _$BienFromJson(json);
  Map<String, dynamic> toJson() => _$BienToJson(this);
}
