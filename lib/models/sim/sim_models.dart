import 'package:equatable/equatable.dart';

class SimCountries extends Equatable {
  final String productId;
  final String productName;
  final String shortDescription;
  final String? fullDescription;
  final String productType;

  final List<String> characteristics;
  final List<Coverage> coverage;
  final String image;
  final String? cardImage;
  final List<PlanData> planes;

  const SimCountries({
    required this.productId,
    required this.productName,
    required this.shortDescription,
    this.fullDescription,
    required this.productType,
    required this.characteristics,
    required this.coverage,
    required this.image,
    this.cardImage,
    required this.planes,
  });

  @override
  List<Object?> get props => [
        productId,
        productName,
        shortDescription,
        fullDescription,
        productType,
        characteristics,
        coverage,
        image,
        planes,
      ];
}

class PlanData extends Equatable {
  final String days;
  final int price;
  final String? currentyType;
  final String gbCount;

  const PlanData({
    required this.price,
    this.currentyType,
    required this.days,
    required this.gbCount,
  });

  @override
  List<Object?> get props => [days, price, currentyType, gbCount];
}

class Coverage extends Equatable {
  final String name;
  final String image;

  const Coverage({required this.name, required this.image});

  @override
  List<Object?> get props => [name, image];
}
