import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datasources/common_data_source.dart';

class DummyCommonDataSourceImpl extends CommonDataSource {
  @override
  Future<Locations> fetchLocationsByQuery({String query}) {
    // TODO: implement fetchLocationsByQuery
    throw UnimplementedError();
  }
}