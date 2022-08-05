import 'package:equatable/equatable.dart';

class PackageListCountry extends Equatable {
  const PackageListCountry({
    required this.data,
    required this.links,
    required this.meta,
  });

  final List<Datum> data;
  final Links links;
  final Meta meta;

  @override
  List<Object?> get props => [data, links, meta];
}

class Datum extends Equatable {
  const Datum({
    required this.slug,
    required this.countryCode,
    required this.title,
    required this.image,
    required this.operators,
  });

  final String slug;
  final String countryCode;
  final String title;
  final ImagePlan image;
  final List<Operator> operators;

  @override
  List<Object?> get props => [slug, countryCode, title, image, operators];
}

class ImagePlan extends Equatable {
  ImagePlan({
    required this.width,
    required this.height,
    required this.url,
  });

  final int width;
  final int height;
  final String url;

  @override
  List<Object?> get props => [width, height, url];
}

class Operator extends Equatable {
  Operator({
    required this.id,
    required this.style,
    required this.gradientStart,
    required this.gradientEnd,
    required this.type,
    required this.isPrepaid,
    required this.title,
    required this.esimType,
    required this.warning,
    required this.apnType,
    required this.apnValue,
    required this.isRoaming,
    required this.info,
    required this.image,
    required this.packages,
    required this.countries,
  });

  final int id;
  final String style;
  final String gradientStart;
  final String gradientEnd;
  final String type;
  final bool isPrepaid;
  final String title;
  final String esimType;
  final dynamic warning;
  final String apnType;
  final dynamic apnValue;
  final bool isRoaming;
  final List<String> info;
  final ImagePlan image;
  final List<Package> packages;
  final List<Country> countries;

  @override
  List<Object?> get props => [
        id,
        style,
        gradientStart,
        gradientEnd,
        type,
        isPrepaid,
        title,
        esimType,
        warning,
        apnType,
        apnValue,
        isRoaming,
        info,
        image,
        packages,
        countries
      ];
}

class Country extends Equatable {
  Country({
    required this.countryCode,
    required this.title,
    required this.image,
  });

  final String countryCode;
  final String title;
  final ImagePlan image;

  @override
  List<Object?> get props => [countryCode, title, image];
}

class Package extends Equatable {
  Package({
    required this.id,
    required this.type,
    required this.price,
    required this.amount,
    required this.day,
    required this.isUnlimited,
    required this.title,
    required this.data,
    required this.shortInfo,
  });

  final String id;
  final String type;
  final double price;
  final int amount;
  final int day;
  final bool isUnlimited;
  final String title;
  final String data;
  final String shortInfo;

  @override
  List<Object?> get props => [
        id,
        type,
        price,
        amount,
        day,
        isUnlimited,
        title,
        data,
        shortInfo,
      ];
}

class Links extends Equatable {
  const Links({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  final String first;
  final String last;
  final dynamic prev;
  final dynamic next;

  @override
  List<Object?> get props => [first, last, prev, next];
}

class Meta extends Equatable {
  Meta({
    this.message,
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  String? message;
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  String? perPage;
  int? to;
  int? total;

  @override
  List<Object?> get props => [
        message,
        currentPage,
        from,
        lastPage,
        path,
        perPage,
        to,
        total,
      ];
}
