import 'package:flutter/material.dart';

import '../widgets.dart';

Widget searchBarWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          color: const Color.fromARGB(255, 4, 45, 90),

          height: 37,
          //margin: const EdgeInsets.only(left: 15),
          child: Material(
            //color: const Color.fromARGB(255, 4, 45, 90),
            borderRadius: BorderRadius.circular(7),
            elevation: 1,
            child: TextFormField(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CountrySearchDelegate(),
                );
              },
              decoration: const InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 4, 45, 90),
                  contentPadding: EdgeInsets.only(top: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  hintText: 'Buscar en Simlimites',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  )),
            ),
          ),
        ),
      ),
    ],
  );
}
