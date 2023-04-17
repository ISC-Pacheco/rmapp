class Bieness {
  int? id;
  String? nombre;
  String? caracteristicas;
  String? num_inventario;
  String? nick;
  String? serie;
  double? costo;
  int? stock;
  int? id_color;
  int? id_tipob;
  int? id_tipoadqui;
  String? fechaadqui;
  int? condicion;
  int? id_categoria;
  int? id_proveedor;
  int? id_modelo;
  int? id_estado;
  int? id_marca;
  String? created_at;
  String? updated_at;
  String? factura;

  Bieness(
      {this.id,
      this.nombre,
      this.caracteristicas,
      this.num_inventario,
      this.nick,
      this.serie,
      this.costo,
      this.stock,
      this.id_color,
      this.id_tipob,
      this.id_tipoadqui,
      this.fechaadqui,
      this.condicion,
      this.id_categoria,
      this.id_proveedor,
      this.id_modelo,
      this.id_estado,
      this.id_marca,
      this.created_at,
      this.updated_at,
      this.factura});

  factory Bieness.fromJson(Map<String, dynamic> json) {
    return Bieness(
      id: json['id'],
      nombre: json['nombre'],
      caracteristicas: json['caracteristicas'],
      num_inventario: json['num_inventario'],
      nick: json['nick'],
      serie: json['serie'],
      costo: json['costo'],
      stock: json['stock'],
      id_color: json['id_color'],
      id_tipob: json['id_tipob'],
      id_tipoadqui: json['id_tipoadqui'],
      fechaadqui: json['fechaadqui'],
      condicion: json['condicion'],
      id_categoria: json['id_categoria'],
      id_proveedor: json['id_proveedor'],
      id_modelo: json['id_modelo'],
      id_estado: json['id_estado'],
      id_marca: json['id_marca'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      factura: json['factura'],
    );
  }
}
