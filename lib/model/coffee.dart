import 'package:json_annotation/json_annotation.dart';

part 'coffee.g.dart';

@JsonSerializable(nullable: false)

class Coffee {
  final String name;
  final String currency;
  final String price;
  final String imagePath;
  final String description;

  Coffee({
    required this.name,
    required this.currency,
    required this.price,
    required this.imagePath,
    required this.description,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);
  Map<String, dynamic> toJson() => _$CoffeeToJson(this);
}