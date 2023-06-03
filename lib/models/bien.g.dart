// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bien.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bien _$BienFromJson(Map<String, dynamic> json) => Bien()
  ..id = json['id'] as String
  ..nombre = json['nombre'] as String
  ..caracteristicas = json['caracteristicas'] as String
  ..num_inventario = json['num_inventario'] as String
  ..nick = json['nick'] as String
  ..serie = json['serie'] as String
  ..costo = json['costo'] as String
  ..stock = json['stock'] as String
  ..id_color = json['id_color'] as String
  ..id_tipob = json['id_tipob'] as String
  ..id_tipoadqui = json['id_tipoadqui'] as String
  ..fechadqui = json['fechadqui'] as String
  ..condicion = json['condicion'] as String
  ..id_categoria = json['id_categoria'] as String
  ..id_provedor = json['id_provedor'] as String
  ..id_modelo = json['id_modelo'] as String
  ..id_estado = json['id_estado'] as String
  ..id_marca = json['id_marca'] as String
  ..created_at = json['created_at'] as String
  ..updated_at = json['updated_at'] as String
  ..factura = json['factura'] as String;

Map<String, dynamic> _$BienToJson(Bien instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'caracteristicas': instance.caracteristicas,
      'num_inventario': instance.num_inventario,
      'nick': instance.nick,
      'serie': instance.serie,
      'costo': instance.costo,
      'stock': instance.stock,
      'id_color': instance.id_color,
      'id_tipob': instance.id_tipob,
      'id_tipoadqui': instance.id_tipoadqui,
      'fechadqui': instance.fechadqui,
      'condicion': instance.condicion,
      'id_categoria': instance.id_categoria,
      'id_provedor': instance.id_provedor,
      'id_modelo': instance.id_modelo,
      'id_estado': instance.id_estado,
      'id_marca': instance.id_marca,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'factura': instance.factura,
    };
