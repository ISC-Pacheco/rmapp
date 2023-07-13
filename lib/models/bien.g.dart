// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bien.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bien _$BienFromJson(Map<String, dynamic> json) => Bien()
  ..id = json['id'] as String
  ..inventario = json['inventario'] as String
  ..descripcion_bien = json['descripcion_bien'] as String
  ..caracteristicas = json['caracteristicas'] as String
  ..resguardatorio = json['resguardatorio'] as String
  ..nick = json['nick'] as String
  ..areas = json['areas'] as String
  ..ubicacion = json['ubicacion'] as String
  ..valor = json['valor'] as String
  ..anotacion = json['anotacion'] as String;

Map<String, dynamic> _$BienToJson(Bien instance) => <String, dynamic>{
      'id': instance.id,
      'inventario': instance.inventario,
      'descripcion_bien': instance.descripcion_bien,
      'caracteristicas': instance.caracteristicas,
      'resguardatorio': instance.resguardatorio,
      'nick': instance.nick,
      'areas': instance.areas,
      'ubicacion': instance.ubicacion,
      'valor': instance.valor,
      'anotacion': instance.anotacion,
    };
