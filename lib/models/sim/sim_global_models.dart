import 'package:equatable/equatable.dart';

class SimGlobalModel extends Equatable {
  final String productId;
  final String productName;
  final String shortDescription;
  final String? fullDescription;
  final String productType;

  final String characteristics;
  final List<CoverageGlobal> coverage;
  final String image;
  final List<PlanDataGlobal> planes;

  const SimGlobalModel({
    required this.productId,
    required this.productName,
    required this.shortDescription,
    this.fullDescription,
    required this.productType,
    required this.characteristics,
    required this.coverage,
    required this.image,
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

  static List<SimGlobalModel> globalList = [
    SimGlobalModel(
        productId: "global1",
        productName: "Global 1",
        shortDescription: "shortDescription",
        productType: "regional",
        characteristics: "characteristics",
        coverage: [
          CoverageGlobal(name: "pais 1", image: "assets/regional/pais1"),
          CoverageGlobal(name: "pais 2", image: "assets/regional/pais2"),
          CoverageGlobal(name: "pais 3", image: "assets/regional/pais3"),
        ],
        image: "assets/regional.png",
        planes: const [
          PlanDataGlobal(
              price: 23, currencyType: 'USD', days: '5', gbCount: '5GB'),
          PlanDataGlobal(
              price: 30, currencyType: 'USD', days: '7', gbCount: '20GB'),
          PlanDataGlobal(
              price: 35, currencyType: 'USD', days: '15', gbCount: '35GB'),
          PlanDataGlobal(
              price: 45, currencyType: 'USD', days: '30', gbCount: '45GB'),
          PlanDataGlobal(
              price: 100, currencyType: 'USD', days: '60', gbCount: '120GB'),
        ]),
    SimGlobalModel(
        productId: "global2",
        productName: "Global 2",
        shortDescription: "shortDescription",
        productType: "regional",
        characteristics: "characteristics",
        coverage: [
          CoverageGlobal(name: "pais 1", image: "assets/regional/pais1"),
          CoverageGlobal(name: "pais 2", image: "assets/regional/pais2"),
          CoverageGlobal(name: "pais 3", image: "assets/regional/pais3"),
        ],
        image: "assets/regional.png",
        planes: const [
          PlanDataGlobal(
              price: 23, currencyType: 'USD', days: '5', gbCount: '5GB'),
          PlanDataGlobal(
              price: 30, currencyType: 'USD', days: '7', gbCount: '20GB'),
          PlanDataGlobal(
              price: 35, currencyType: 'USD', days: '15', gbCount: '35GB'),
          PlanDataGlobal(
              price: 45, currencyType: 'USD', days: '30', gbCount: '45GB'),
          PlanDataGlobal(
              price: 100, currencyType: 'USD', days: '60', gbCount: '120GB'),
        ]),
  ];
}

class PlanDataGlobal extends Equatable {
  final String days;
  final int price;
  final String? currencyType;
  final String gbCount;

  const PlanDataGlobal({
    required this.days,
    required this.price,
    required this.gbCount,
    this.currencyType,
  });

  @override
  List<Object?> get props => [
        days,
        price,
        currencyType,
        gbCount,
      ];
}

class CoverageGlobal extends Equatable {
  final String name;
  final String image;

  CoverageGlobal({required this.name, required this.image});

  @override
  List<Object?> get props => [name, image];
}
