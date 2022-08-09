// To parse this JSON data, do
//
//     final packageListCountryResponse = packageListCountryResponseFromJson(jsonString);

import 'dart:convert';

import 'package:simlimites/domain/entities/package_lists.dart';

PackageListCountryModel packageListCountryResponseFromJson(String str) =>
    PackageListCountryModel.fromJson(json.decode(str));

class PackageListCountryModel extends PackageListCountry {
  const PackageListCountryModel({
    required this.data,
    required this.links,
    required this.meta,
  }) : super(data: data, links: links, meta: meta);

  final List<DatumModel> data;
  final LinksModel links;
  final MetaModel meta;

  factory PackageListCountryModel.fromJson(Map<String, dynamic> json) =>
      PackageListCountryModel(
        data: List<DatumModel>.from(
            json["data"].map((x) => DatumModel.fromJson(x))),
        links: LinksModel.fromJson(json["links"]),
        meta: MetaModel.fromJson(json["meta"]),
      );
}

class DatumModel extends Datum {
  const DatumModel({
    required this.slug,
    required this.countryCode,
    required this.title,
    required this.image,
    required this.operators,
  }) : super(
            slug: slug,
            countryCode: countryCode,
            title: title,
            image: image,
            operators: operators);

  final String slug;
  final String countryCode;
  final String title;
  final ImageModel image;
  final List<OperatorModel> operators;

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        slug: json["slug"],
        countryCode: json["country_code"],
        title: json["title"],
        image: ImageModel.fromJson(json["image"]),
        operators: List<OperatorModel>.from(
            json["operators"].map((x) => OperatorModel.fromJson(x))),
      );
}

class ImageModel extends ImagePlan {
  const ImageModel({
    required this.width,
    required this.height,
    required this.url,
  }) : super(width: width, height: height, url: url);

  final int width;
  final int height;
  final String url;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );
}

class OperatorModel extends Operator {
  const OperatorModel({
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
    this.apnValue,
    required this.isRoaming,
    required this.info,
    required this.image,
    required this.packages,
    required this.countries,
  }) : super(
          id: id,
          style: style,
          gradientStart: gradientStart,
          gradientEnd: gradientEnd,
          type: type,
          isPrepaid: isPrepaid,
          title: title,
          esimType: esimType,
          warning: warning,
          apnType: apnType,
          apnValue: apnValue,
          isRoaming: isRoaming,
          info: info,
          image: image,
          packages: packages,
          countries: countries,
        );

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
  final ImageModel image;
  final List<PackageModel> packages;
  final List<CountryModel> countries;

  factory OperatorModel.fromJson(Map<String, dynamic> json) => OperatorModel(
        id: json["id"],
        style: json["style"],
        gradientStart: json["gradient_start"],
        gradientEnd: json["gradient_end"],
        type: json["type"],
        isPrepaid: json["is_prepaid"],
        title: json["title"],
        esimType: json["esim_type"],
        warning: json["warning"],
        apnType: json["apn_type"],
        apnValue: json["apn_value"],
        isRoaming: json["is_roaming"],
        info: List<String>.from(json["info"].map((x) => x)),
        image: ImageModel.fromJson(json["image"]),
        packages: List<PackageModel>.from(
            json["packages"].map((x) => PackageModel.fromJson(x))),
        countries: List<CountryModel>.from(
            json["countries"].map((x) => CountryModel.fromJson(x))),
      );
}

class CountryModel extends Country {
  const CountryModel({
    required this.countryCode,
    required this.title,
    required this.image,
  }) : super(countryCode: countryCode, title: title, image: image);

  final String countryCode;
  final String title;
  final ImageModel image;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        countryCode: json["country_code"],
        title: json["title"],
        image: ImageModel.fromJson(json["image"]),
      );
}

class PackageModel extends Package {
  const PackageModel({
    required this.id,
    required this.type,
    required this.price,
    required this.amount,
    required this.day,
    required this.isUnlimited,
    required this.title,
    required this.data,
    required this.shortInfo,
  }) : super(
          id: id,
          type: type,
          price: price,
          amount: amount,
          day: day,
          isUnlimited: isUnlimited,
          title: title,
          data: data,
          shortInfo: shortInfo,
        );

  final String id;
  final String type;
  final double price;
  final int amount;
  final int day;
  final bool isUnlimited;
  final String title;
  final String data;
  final String shortInfo;

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        id: json["id"],
        type: json["type"],
        price: json["price"].toDouble(),
        amount: json["amount"],
        day: json["day"],
        isUnlimited: json["is_unlimited"],
        title: json["title"],
        data: json["data"],
        shortInfo: json["short_info"],
      );
}

class LinksModel extends Links {
  const LinksModel({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  }) : super(first: first, last: last, prev: prev, next: next);

  final String first;
  final String last;
  final dynamic prev;
  final dynamic next;

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );
}

class MetaModel extends Meta {
  const MetaModel({
    this.message,
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  }) : super(
            message: message,
            currentPage: currentPage,
            from: from,
            lastPage: lastPage,
            path: path,
            perPage: perPage,
            to: to,
            total: total);

  final String? message;
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final String? perPage;
  final int? to;
  final int? total;

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        message: json["message"],
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );
}
