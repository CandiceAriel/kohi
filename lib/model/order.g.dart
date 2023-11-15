// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      Id: json['Id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,
      qty: json['qty'] as int,
      //total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'Id': instance.Id,
      'name': instance.name,
      'price': instance.price,
      'qty': instance.qty,
      //'total': instance.total,
    };
