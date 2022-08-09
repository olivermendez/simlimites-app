import 'package:flutter/material.dart';
import 'package:simlimites/models/sim/esim_models.dart';

import '../../models/sim/data.dart';

import '../pages/products_pages/single_product.dart';
import 'widgets.dart';

class CountrySearchDelegate extends SearchDelegate {
  List<SimCountries> searchResults = DataServices.countriesList;

  @override
  String? get searchFieldLabel => 'Buscar';

  @override
  TextStyle? get searchFieldStyle {
    return const TextStyle(color: Colors.white, fontSize: 18);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          appBarTheme: super.appBarTheme(context).appBarTheme.copyWith(
                elevation: 0.0,
                backgroundColor: const Color.fromARGB(255, 4, 45, 90),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
        );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(
          Icons.clear,
          color: Colors.white,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Text('no hay valor en el query');
    }

    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SimCountries> suggestions = searchResults.where((searchResult) {
      final result = searchResult.productName.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final single = suggestions[index];
          return ListTile(
            title: Text(single.productName),
            subtitle: Text(single.shortDescription),
            //leading: flagIconWidget(single),
            onTap: () {
              /*
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    product: single,
                  ),
                ),
              );
              */
              //query = single.productName;
              //showResults(context);
            },
          );
        });
  }
}
