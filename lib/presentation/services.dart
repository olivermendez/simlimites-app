import 'dart:convert';

import 'package:http/http.dart' as http;

class DataServices {
  String username = 'FkwVTfEazDZRIJU';
  String password = 'Oku8onziLBj9IYlJmATEegWcx';
  final baseUrl = 'easyactivations.com';

  Future<String> getProductList() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    final uri = Uri.https(baseUrl, '/api/productType');
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Authorization': basicAuth,
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
    return response.body;
  }

  Future<String> getProductDetail() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final uri = Uri.https(baseUrl, '/api/product');

    Map<String, dynamic> request = {
      "sku": 'eSIM Armenia',
    };

    final response = await http.post(
      uri,
      body: jsonEncode(request),
      headers: <String, String>{
        'Authorization': basicAuth,
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
    return response.body;
  }

  Future<String> placeOrderATT() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final uri = Uri.https(baseUrl, '/api/place_order');

    Map<String, dynamic> request = {
      "products": [
        {
          "sku": "ATT-ESIM-US-CA-MEX",
          "date_range": "1_1",
          "product_qty": 1,
          "start_date": "2022-05-06",
          "end_date": "2022-05-07",
          "imei_number": "356423100231640",
          "user": {
            "first_name": "Test",
            "last_name": "Testing",
            "email": "test_testing@gmail.com",
            "contact_number": "+12355551122"
          }
        },
      ]
    };

    final response = await http.post(
      uri,
      body: jsonEncode(request),
      headers: <String, String>{
        'Authorization': basicAuth,
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
    return response.body;
  }

  Future<String> checkEsimStatusExpirydate() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final uri = Uri.https(baseUrl, '/api/checkEsimStatusExpirydate');

    Map<String, dynamic> request = {
      "sku": 'eSIM Armenia',
    };

    final response = await http.post(
      uri,
      body: jsonEncode(request),
      headers: <String, String>{
        'Authorization': basicAuth,
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
    return response.body;
  }

  Future<String> checkImeiNumber() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final uri = Uri.https(baseUrl, '/api/checkEsimStatusExpirydate');

    Map<String, dynamic> request = {
      "sku": 'eSIM Armenia',
    };

    final response = await http.post(
      uri,
      body: jsonEncode(request),
      headers: <String, String>{
        'Authorization': basicAuth,
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
    return response.body;
  }
}
