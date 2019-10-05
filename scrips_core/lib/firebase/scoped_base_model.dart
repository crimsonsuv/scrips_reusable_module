import 'package:scoped_model/scoped_model.dart';
import 'package:scrips_core/enums/view_state.dart';

export 'package:scrips_core/enums/view_state.dart';

class ScopedBaseModel extends Model {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;

    // Notify listeners will only update listeners of state.
    notifyListeners();
  }
}
