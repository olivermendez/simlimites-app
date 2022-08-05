import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simlimites/domain/repositories/ipackage_list_rp.dart';
import 'package:simlimites/infraestructure/models/package_list_model.dart';

import 'package:http/http.dart' as http;

import '../../core/error/errors.dart';

class PackageDatasourcesApi extends IPackageListRepository {
  @override
  Future<List<DatumModel>> getOperatorsByCountry() async {
    final remoteUrl = dotenv.get('API_URL');
    final token = dotenv.get('TOKEN');

    //{{url}}/{{version}}/packages?filter[country]=US&limit=100&page=1&sort=+country_code&filter[type]=local

    var url = Uri.parse('${remoteUrl}packages?filter[country]=US');

    final response = await http.get(
      url,
      headers: {'accept': 'application/json', 'authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final resp = packageListCountryResponseFromJson(response.body);
      final data = resp.data;
      return data;
    } else {
      throw ApiErrors();
    }

    //throw UnimplementedError();
  }
}
