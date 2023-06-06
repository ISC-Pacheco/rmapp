// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resguardo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resguardo _$ResguardoFromJson(Map<String, dynamic> json) => Resguardo()
  ..nombre = json['nombre'] as String
  ..Fecha = json['Fecha'] as String
  ..Cantidad = json['Cantidad'] as String
  ..resguardo = json['resguardo'] as String
  ..registro = json['registro'] as String
  ..actualizacion = json['actualizacion'] as String;

Map<String, dynamic> _$ResguardoToJson(Resguardo instance) => <String, dynamic>{
      'nombre': instance.nombre,
      'Fecha': instance.Fecha,
      'Cantidad': instance.Cantidad,
      'resguardo': instance.resguardo,
      'registro': instance.registro,
      'actualizacion': instance.actualizacion,
    };
