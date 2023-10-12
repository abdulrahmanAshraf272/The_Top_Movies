// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      serverTime: json['serverTime'] as int?,
      serverTimezone: json['serverTimezone'] as String?,
      apiVersion: json['apiVersion'] as int?,
      executionTime: json['executionTime'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'serverTime': instance.serverTime,
      'serverTimezone': instance.serverTimezone,
      'apiVersion': instance.apiVersion,
      'executionTime': instance.executionTime,
    };
