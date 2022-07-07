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

  static List<SimCountries> countriesList = const [
    SimCountries(
      productId: 'productId',
      productName: 'Estados Unidos',
      shortDescription: 'shortDescription',
      fullDescription: 'fullDescription',
      cardImage: 'assets/ship.png',
      productType: 'local',
      characteristics: [
        'Llamadas ilimitadas en país de cobertura',
        'Datos ilimitados en 4G LTE (sin degradación',
      ],
      coverage: [
        Coverage(image: '/path', name: 'Estados Unidos'),
        Coverage(image: '/path', name: 'Alaska'),
        Coverage(image: '/path', name: 'Hawai'),
        Coverage(image: '/path', name: 'Islas Vírgenes de EE. UU. '),
        Coverage(image: '/path', name: 'Puerto Rico'),
      ],
      image: 'assets/usa.png',
      planes: [
        PlanData(price: 23, currentyType: 'USD', days: '5', gbCount: '5GB'),
        PlanData(price: 30, currentyType: 'USD', days: '7', gbCount: '20GB'),
        PlanData(price: 35, currentyType: 'USD', days: '15', gbCount: '35GB'),
        PlanData(price: 45, currentyType: 'USD', days: '30', gbCount: '45GB'),
        PlanData(price: 100, currentyType: 'USD', days: '60', gbCount: '120GB'),
      ],
    ),
    SimCountries(
      productId: 'productId',
      productName: 'Colombia',
      shortDescription: 'shortDescription',
      fullDescription: 'fullDescription',
      productType: 'local',
      cardImage: 'assets/ship.png',
      characteristics: [
        'Llamadas ilimitadas en país de cobertura',
        'Datos ilimitados en 4G LTE (sin degradación',
      ],
      coverage: [
        Coverage(image: '/path', name: 'Estados Unidos'),
        Coverage(image: '/path', name: 'Alaska'),
        Coverage(image: '/path', name: 'Hawai'),
        Coverage(image: '/path', name: 'Islas Vírgenes de EE. UU. '),
        Coverage(image: '/path', name: 'Puerto Rico'),
      ],
      image: 'assets/colombia.png',
      planes: [
        PlanData(price: 23, currentyType: 'USD', days: '5', gbCount: '5GB'),
        PlanData(price: 30, currentyType: 'USD', days: '7', gbCount: '20GB'),
        PlanData(price: 35, currentyType: 'USD', days: '15', gbCount: '35GB'),
        PlanData(price: 45, currentyType: 'USD', days: '30', gbCount: '45GB'),
        PlanData(price: 100, currentyType: 'USD', days: '60', gbCount: '120GB'),
      ],
    ),
    SimCountries(
      productId: 'productId',
      productName: 'Canadá',
      shortDescription: 'shortDescription',
      fullDescription: 'fullDescription',
      productType: 'local',
      cardImage: 'assets/ship.png',
      characteristics: [
        'Llamadas ilimitadas en país de cobertura',
        'Datos ilimitados en 4G LTE (sin degradación)',
      ],
      coverage: [
        Coverage(image: '/path', name: 'Estados Unidos'),
        Coverage(image: '/path', name: 'Alaska'),
        Coverage(image: '/path', name: 'Hawai'),
        Coverage(image: '/path', name: 'Islas Vírgenes de EE. UU. '),
        Coverage(image: '/path', name: 'Puerto Rico'),
      ],
      image: 'assets/canada.png',
      planes: [
        PlanData(price: 23, currentyType: 'USD', days: '5', gbCount: '5GB'),
        PlanData(price: 30, currentyType: 'USD', days: '7', gbCount: '20GB'),
        PlanData(price: 35, currentyType: 'USD', days: '15', gbCount: '35GB'),
        PlanData(price: 45, currentyType: 'USD', days: '30', gbCount: '45GB'),
        PlanData(price: 100, currentyType: 'USD', days: '60', gbCount: '120GB'),
      ],
    ),
    SimCountries(
      productId: 'productId',
      productName: 'México',
      shortDescription: 'shortDescription',
      fullDescription: 'fullDescription',
      productType: 'local',
      cardImage: 'assets/ship.png',
      characteristics: [
        'Llamadas ilimitadas en país de cobertura',
        'Datos ilimitados en 4G LTE (sin degradación)',
      ],
      coverage: [
        Coverage(image: '/path', name: 'Estados Unidos'),
        Coverage(image: '/path', name: 'Alaska'),
        Coverage(image: '/path', name: 'Hawai'),
        Coverage(image: '/path', name: 'Islas Vírgenes de EE. UU. '),
        Coverage(image: '/path', name: 'Puerto Rico'),
      ],
      image: 'assets/mexico.png',
      planes: [
        PlanData(price: 23, currentyType: 'USD', days: '5', gbCount: '5GB'),
        PlanData(price: 30, currentyType: 'USD', days: '7', gbCount: '20GB'),
        PlanData(price: 35, currentyType: 'USD', days: '15', gbCount: '35GB'),
        PlanData(price: 45, currentyType: 'USD', days: '30', gbCount: '45GB'),
        PlanData(price: 100, currentyType: 'USD', days: '60', gbCount: '120GB'),
      ],
    ),
    SimCountries(
      productId: 'productId',
      productName: 'Perú',
      shortDescription: 'shortDescription',
      fullDescription: 'fullDescription',
      productType: 'local',
      cardImage: 'assets/ship.png',
      characteristics: [
        'Llamadas ilimitadas en país de cobertura',
        'Datos ilimitados en 4G LTE (sin degradación)',
      ],
      coverage: [
        Coverage(image: '/path', name: 'Estados Unidos'),
        Coverage(image: '/path', name: 'Alaska'),
        Coverage(image: '/path', name: 'Hawai'),
        Coverage(image: '/path', name: 'Islas Vírgenes de EE. UU. '),
        Coverage(image: '/path', name: 'Puerto Rico'),
      ],
      image: 'assets/peru.png',
      planes: [
        PlanData(price: 23, currentyType: 'USD', days: '5', gbCount: '5GB'),
        PlanData(price: 30, currentyType: 'USD', days: '7', gbCount: '20GB'),
        PlanData(price: 35, currentyType: 'USD', days: '15', gbCount: '35GB'),
        PlanData(price: 45, currentyType: 'USD', days: '30', gbCount: '45GB'),
        PlanData(price: 100, currentyType: 'USD', days: '60', gbCount: '120GB'),
      ],
    ),
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
