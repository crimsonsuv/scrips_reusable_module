import 'package:scrips_core/datamodels/firebase/stats.dart';
import 'package:scrips_core/firebase/scoped_base_model.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/services/firebase/firebase_service.dart';

export 'package:scrips_core/enums/view_state.dart';

class ScopedHomeViewModel extends ScopedBaseModel {
  FirebaseService _firebaseService = locator<FirebaseService>();
  Stats appStats;

  ScopedHomeViewModel() {
    _firebaseService.appStats.listen(_onStatsUpdated);
  }

  void _onStatsUpdated(Stats stats) {
    appStats = stats; // Set the stats for the UI

    if (stats == null) {
      setState(ViewState.Busy); // If null indicate we're still fetching
    } else {
      setState(ViewState.DataFetched); // When not null indicate that the data is fetched
    }
  }
}
