// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bien.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bien _$BienFromJson(Map<String, dynamic> json) => Bien()
  ..id = json['id'] as String
  ..descripcion_bien = json['descripcion_bien'] as String
  ..resguardatorio = json['resguardatorio'] as String
  ..nick = json['nick'] as String
  ..inventario = json['inventario'] as String
  ..areas = json['areas'] as String
  ..valor = json['valor'] as String
  ..caracteristicas = json['caracteristicas'] as String
  ..anotacion = json['anotacion'] as String;

Map<String, dynamic> _$BienToJson(Bien instance) => <String, dynamic>{
      'id': instance.id,
      'descripcion_bien': instance.descripcion_bien,
      'resguardatorio': instance.resguardatorio,
      'nick': instance.nick,
      'inventario': instance.inventario,
      'areas': instance.areas,
      'valor': instance.valor,
      'caracteristicas': instance.caracteristicas,
      'anotacion': instance.anotacion,
    };
