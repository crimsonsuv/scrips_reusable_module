import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  final Widget body;
  final Widget bottomNavigationBar;
  final Function() unFocus;

  const ScreenWidget(
      {Key key, this.body, this.bottomNavigationBar, this.unFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          bottomNavigationBar: bottomNavigationBar,
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: body),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          if (unFocus != null) {
            unFocus();
          }
        },
      );
  }
}
