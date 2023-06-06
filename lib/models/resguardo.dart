import 'package:json_annotation/json_annotation.dart';

part 'resguardo.g.dart';

@JsonSerializable()
class Resguardo {
  Resguardo();

  late String nombre;
  late String Fecha;
  late String Cantidad;
  late String resguardo;
  late String registro;
  late String actualizacion;
  
  factory Resguardo.fromJson(Map<String,dynamic> json) => _$ResguardoFromJson(json);
  Map<String, dynamic> toJson() => _$ResguardoToJson(this);
}
