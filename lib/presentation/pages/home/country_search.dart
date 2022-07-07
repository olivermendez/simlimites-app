import 'package:flutter/material.dart';
import 'package:simlimites/models/sim/sim_models.dart';

import '../products_pages/single_product.dart';

class CountrySearchDelegate extends SearchDelegate {
  List<SimCountries> searchResults = SimCountries.countriesList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios));
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
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    coverage: single.coverage,
                    image: single.image,
                    titleCountry: single.productName,
                    datas: single.planes,
                  ),
                ),
              );
              //query = single.productName;
              //showResults(context);
            },
          );
        });
  }
}