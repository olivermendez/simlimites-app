import 'package:simlimites/domain/repositories/ipackage_list_rp.dart';

import '../../infraestructure/models/package_list_model.dart';

class PackageListUsesCases {
  final IPackageListRepository _iPackageListRepository;
  PackageListUsesCases(this._iPackageListRepository);

  Future<List<DatumModel>> getOperators() {
    return _iPackageListRepository.getOperatorsByCountry();
  }
}
