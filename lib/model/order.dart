import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(nullable: false)

class Order {
  int Id;
  String name;
  String price;
  int qty;
  //double total;

  Order({
    required this.Id,
    required this.name,
    required this.price,
    required this.qty,
    //required this.total
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}