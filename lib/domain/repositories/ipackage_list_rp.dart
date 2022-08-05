import 'package:simlimites/infraestructure/models/package_list_model.dart';

abstract class IPackageListRepository {
  Future<List<DatumModel>> getOperatorsByCountry();
}
