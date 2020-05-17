import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:scrips_core/data_models/dialog/alert_request.dart';
import 'package:scrips_core/data_models/dialog/alert_response.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/services/dialog/dialog_service.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    Alert(
        context: context,
        title: request.title,
        desc: request.description,
        closeFunction: () => _dialogService.dialogComplete(AlertResponse(confirmed: false)),
        buttons: [
          DialogButton(
            child: PlatformText(request.buttonTitle),
            onPressed: () {
              _dialogService.dialogComplete(AlertResponse(confirmed: true));
              Navigator.of(context).pop();
            },
          )
        ]).show();
  }
}
