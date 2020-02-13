import 'package:scrips_core/common/data/datamodels/locations_model.dart';

abstract class CommonDataSource {
  Future<Locations> fetchLocationsByQuery({String query});
}
