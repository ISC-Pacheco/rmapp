import 'package:json_annotation/json_annotation.dart';
import "resguardo.dart";
part 'resguardos.g.dart';

@JsonSerializable()
class Resguardos {
  Resguardos();

  late List<Resguardo> resguardos;
  
  factory Resguardos.fromJson(Map<String,dynamic> json) => _$ResguardosFromJson(json);
  Map<String, dynamic> toJson() => _$ResguardosToJson(this);
}
