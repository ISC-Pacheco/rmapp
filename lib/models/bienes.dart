import 'package:json_annotation/json_annotation.dart';
import "bien.dart";
part 'bienes.g.dart';

@JsonSerializable()
class Bienes {
  Bienes();

  List<Bien>? bienes;

  factory Bienes.fromJson(Map<String, dynamic> json) => _$BienesFromJson(json);
  Map<String, dynamic> toJson() => _$BienesToJson(this);
  //filter list

  static Bienes filterList(Bienes bienes, String filterString) {
    Bienes tempBienes = bienes;
    List<Bien> _bienes = tempBienes.bienes!
        .where((b) =>
            (b.areas.toLowerCase().contains(filterString.toLowerCase())) ||
            (b.resguardatorio
                .toLowerCase()
                .contains(filterString.toLowerCase())) ||
            (b.ubicacion.toLowerCase().contains(filterString.toLowerCase())) ||
            (b.inventario.toLowerCase().contains(filterString.toLowerCase())))
        .toList();
    bienes.bienes = _bienes;
    return bienes;
  }
}
