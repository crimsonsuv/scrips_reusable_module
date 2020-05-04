import 'package:flutter/foundation.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/services/dialog/dialog_service.dart';

class DialogViewModel extends ChangeNotifier {
  final DialogService _dialogService = locator<DialogService>();

  Future getUserConfirmation() async {
    print('dialog shown');
    var dialogResult = await _dialogService.showDialog(
        title: 'Dialog Manager', description: 'FilledStacks architecture is always awesome');

    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }
}
