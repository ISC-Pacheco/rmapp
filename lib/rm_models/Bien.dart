class BienMaterial {
  String id;
  String nombre;
  String caracteristicas;
  String numInventario = "Sin registro";
  String nick;
  String serie;
  String costo;
  String stock;
  String idColor;
  String idTipob;
  String idTipoadqui;
  String fechadqui;
  String condicion;
  String idCategoria;
  String idProvedor;
  String idModelo;
  String idEstado;
  String idMarca;
  String createdAt;
  String updatedAt;
  String factura;

  BienMaterial(
      this.id,
      this.nombre,
      this.caracteristicas,
      this.numInventario,
      this.nick,
      this.serie,
      this.costo,
      this.stock,
      this.idColor,
      this.idTipob,
      this.idTipoadqui,
      this.fechadqui,
      this.condicion,
      this.idCategoria,
      this.idProvedor,
      this.idModelo,
      this.idEstado,
      this.idMarca,
      this.createdAt,
      this.updatedAt,
      this.factura) {
    String? id = this.id;
    String? nombre = this.nombre;
    String? caracteristicas = this.caracteristicas;
    String? numInventario = this.numInventario;
    String? nick = this.nick;
    String? serie = this.serie;
    String? costo = this.costo;
    String? stock = this.stock;
    String? idColor = this.idColor;
    String? idTipob = this.idTipob;
    String? idTipoadqui = this.idTipoadqui;
    String? fechadqui = this.fechadqui;
    String? condicion = this.condicion;
    String? idCategoria = this.idCategoria;
    String? idProvedor = this.idProvedor;
    String? idModelo = this.idModelo;
    String? idEstado = this.idEstado;
    String? idMarca = this.idMarca;
    String? createdAt = this.createdAt;
    String? updatedAt = this.updatedAt;
    String? factura = this.factura;
  }
}
