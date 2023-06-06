// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resguardos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resguardos _$ResguardosFromJson(Map<String, dynamic> json) => Resguardos()
  ..resguardos = (json['resguardos'] as List<dynamic>)
      .map((e) => Resguardo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ResguardosToJson(Resguardos instance) =>
    <String, dynamic>{
      'resguardos': instance.resguardos,
    };
