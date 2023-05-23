import 'show_bienes_model.dart';

class Bienes {
  Bienes();
  static List<BienesModelo> fromJsonList(List<dynamic> jsonList) {
    List<BienesModelo> items = [];
    if (jsonList != null) {
      for (var item in jsonList) {
        final bien = new BienesModelo.fromJson(item);
        items.add(bien);
      }
    }
    return items;
  }
}
