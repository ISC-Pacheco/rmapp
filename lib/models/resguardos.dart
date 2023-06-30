import 'package:json_annotation/json_annotation.dart';
import "resguardo.dart";
part 'resguardos.g.dart';

@JsonSerializable()
class Resguardos {
  Resguardos();

  List<Resguardo>? resguardos;

  factory Resguardos.fromJson(Map<String, dynamic> json) =>
      _$ResguardosFromJson(json);
  Map<String, dynamic> toJson() => _$ResguardosToJson(this);

  static Resguardos filterList(Resguardos resguardos, String filterString) {
    Resguardos tempBienes = resguardos;
    List<Resguardo> _resguardos = tempBienes.resguardos!
        .where((b) =>
            (b.nombre.toLowerCase().contains(filterString.toLowerCase())) ||
            (b.resguardo.toLowerCase().contains(filterString.toLowerCase())) ||
            (b.Fecha.toLowerCase().contains(filterString.toLowerCase())))
        .toList();
    resguardos.resguardos = _resguardos;
    return resguardos;
  }
}
