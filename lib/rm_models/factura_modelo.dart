class Factura {
  final String nombre;
  final String costo;
  final List<LineItem> items;
  Factura(this.nombre, this.costo, this.items);
  double totalCost() {
    return items.fold(
        0, (previousValue, element) => previousValue + element.cost);
  }
}

class LineItem {
  final String description;
  final double cost;

  LineItem(this.description, this.cost);
}
