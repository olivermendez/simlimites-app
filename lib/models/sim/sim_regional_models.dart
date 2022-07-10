import 'package:equatable/equatable.dart';

class SimRegionalModel extends Equatable {
  final String productId;
  final String productName;
  final String shortDescription;
  final String? fullDescription;
  final String productType;

  final String characteristics;
  final List<Coverage> coverage;
  final String image;
  final List<PlanDataRegional> planes;

  const SimRegionalModel({
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

  static List<SimRegionalModel> regionalList = [
    SimRegionalModel(
        productId: "regional1",
        productName: "Africa",
        shortDescription: "shortDescription",
        productType: "regional",
        characteristics: "characteristics",
        coverage: [
          Coverage(name: "pais 1", image: "assets/regional/pais1"),
          Coverage(name: "pais 2", image: "assets/regional/pais2"),
          Coverage(name: "pais 3", image: "assets/regional/pais3"),
        ],
        image: "assets/regional.png",
        planes: const [
          PlanDataRegional(
              price: 23, currencyType: 'USD', days: '5', gbCount: '5GB'),
          PlanDataRegional(
              price: 30, currencyType: 'USD', days: '7', gbCount: '20GB'),
          PlanDataRegional(
              price: 35, currencyType: 'USD', days: '15', gbCount: '35GB'),
          PlanDataRegional(
              price: 45, currencyType: 'USD', days: '30', gbCount: '45GB'),
          PlanDataRegional(
              price: 100, currencyType: 'USD', days: '60', gbCount: '120GB'),
        ]),
    SimRegionalModel(
        productId: "regional2",
        productName: "Asia",
        shortDescription: "shortDescription",
        productType: "regional",
        characteristics: "characteristics",
        coverage: [
          Coverage(name: "pais 1", image: "assets/regional/pais1"),
          Coverage(name: "pais 2", image: "assets/regional/pais2"),
          Coverage(name: "pais 3", image: "assets/regional/pais3"),
        ],
        image: "assets/regional.png",
        planes: const [
          PlanDataRegional(
              price: 23, currencyType: 'USD', days: '5', gbCount: '5GB'),
          PlanDataRegional(
              price: 30, currencyType: 'USD', days: '7', gbCount: '20GB'),
          PlanDataRegional(
              price: 35, currencyType: 'USD', days: '15', gbCount: '35GB'),
          PlanDataRegional(
              price: 45, currencyType: 'USD', days: '30', gbCount: '45GB'),
          PlanDataRegional(
              price: 100, currencyType: 'USD', days: '60', gbCount: '120GB'),
        ]),
    SimRegionalModel(
        productId: "regional3",
        productName: "Europa",
        shortDescription: "shortDescription",
        productType: "regional",
        characteristics: "characteristics",
        coverage: [
          Coverage(name: "pais 1", image: "assets/regional/pais1"),
          Coverage(name: "pais 2", image: "assets/regional/pais2"),
          Coverage(name: "pais 3", image: "assets/regional/pais3"),
        ],
        image: "assets/regional.png",
        planes: const [
          PlanDataRegional(
              price: 23, currencyType: 'USD', days: '5', gbCount: '5GB'),
          PlanDataRegional(
              price: 30, currencyType: 'USD', days: '7', gbCount: '20GB'),
          PlanDataRegional(
              price: 35, currencyType: 'USD', days: '15', gbCount: '35GB'),
          PlanDataRegional(
              price: 45, currencyType: 'USD', days: '30', gbCount: '45GB'),
          PlanDataRegional(
              price: 100, currencyType: 'USD', days: '60', gbCount: '120GB'),
        ]),
    SimRegionalModel(
        productId: "regional4",
        productName: "Islas del Caribe",
        shortDescription: "shortDescription",
        productType: "regional",
        characteristics: "characteristics",
        coverage: [
          Coverage(name: "pais 1", image: "assets/regional/pais1"),
          Coverage(name: "pais 2", image: "assets/regional/pais2"),
          Coverage(name: "pais 3", image: "assets/regional/pais3"),
        ],
        image: "assets/regional.png",
        planes: const [
          PlanDataRegional(
              price: 23, currencyType: 'USD', days: '5', gbCount: '5GB'),
          PlanDataRegional(
              price: 30, currencyType: 'USD', days: '7', gbCount: '20GB'),
          PlanDataRegional(
              price: 35, currencyType: 'USD', days: '15', gbCount: '35GB'),
          PlanDataRegional(
              price: 45, currencyType: 'USD', days: '30', gbCount: '45GB'),
          PlanDataRegional(
              price: 100, currencyType: 'USD', days: '60', gbCount: '120GB'),
        ]),
  ];
}

class PlanDataRegional extends Equatable {
  final String days;
  final int price;
  final String? currencyType;
  final String gbCount;

  const PlanDataRegional({
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

class Coverage extends Equatable {
  final String name;
  final String image;

  const Coverage({required this.name, required this.image});

  @override
  List<Object?> get props => [name, image];
}
