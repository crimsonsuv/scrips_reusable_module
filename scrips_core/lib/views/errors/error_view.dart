import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/viewmodels/general/global_model.dart';
import 'package:scrips_core/constants/app_constants.dart';

final _mainPadding = EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0);
final BoxDecoration _mainBorder =
    BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.white70);

class ErrorView extends StatelessWidget {
  final Exception exception;
//
  ErrorView({Key key, this.exception}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    GlobalModel globalModel = Provider.of<GlobalModel>(context, listen: true);
    Exception ex = this.exception != null ? this.exception : globalModel.data.lastException;
    //
    return PlatformScaffold(
      //        key: globalKeyMainScaffold,
      appBar: PlatformAppBar(
        //          key: globalKeyMainAppBar,
        title: const Text(PM_APP_NAME),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: _mainPadding,
        child: Container(
          decoration: _mainBorder,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PlatformText(ex != null ? ex.toString() : 'Unknown Error'),
            ],
          ),
        ),
      ),
    );
  }
}
