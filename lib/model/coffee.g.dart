// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coffee _$CoffeeFromJson(Map<String, dynamic> json) => Coffee(
      name: json['name'] as String,
      price: json['price'] as String,
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CoffeeToJson(Coffee instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'imagePath': instance.imagePath,
      'description': instance.description,
    };
