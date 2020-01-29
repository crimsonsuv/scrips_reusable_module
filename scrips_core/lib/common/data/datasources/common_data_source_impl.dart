import 'package:http/http.dart' as http;
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datasources/common_data_source.dart';
import 'package:scrips_core/constants/status_objects.dart';

class CommonDataSourceImpl extends CommonDataSource {
  int defaultTimeout = 120;
  static final googleAPIKey = 'AIzaSyBCrQ1GzILNdnaeDRUZbKzGc1CIICTIAXw';

  static final endpointPlaces = 'https://maps.googleapis.com/maps/api/place/autocomplete';
  var client = http.Client();

  @override
  Future<Locations> fetchLocationsByQuery({String query}) async{
    var response = await client
        .get('$endpointPlaces/json?input=$query&types=establishment&language=en&key=$googleAPIKey',)
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching locations Failed');
    });
    return locationsFromJson(response.body);
  }
}
