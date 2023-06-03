// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bienes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bienes _$BienesFromJson(Map<String, dynamic> json) => Bienes()
  ..bienes = (json['bienes'] as List<dynamic>)
      .map((e) => Bien.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$BienesToJson(Bienes instance) => <String, dynamic>{
      'bienes': instance.bienes,
    };
