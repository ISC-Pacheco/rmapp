import 'package:json_annotation/json_annotation.dart';
import "bien.dart";
part 'bienes.g.dart';

@JsonSerializable()
class Bienes {
  Bienes();

  List<Bien>? bienes;

  factory Bienes.fromJson(Map<String, dynamic> json) => _$BienesFromJson(json);
  Map<String, dynamic> toJson() => _$BienesToJson(this);
}
