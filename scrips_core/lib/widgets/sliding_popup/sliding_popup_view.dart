import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class SlidingPopupWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final double width;
  final Function onSave;
  final Function onCancel;
  final Color backgroundColor;
  final String doneText;
  final String cancelText;

  SlidingPopupWidget(
      {this.title,
      this.child,
      @required this.width,
      this.doneText = "Save",
      this.cancelText = "Cancel",
      this.onSave,
      this.onCancel,
      this.backgroundColor = Colors.white});

  @override
  _SlidingPopupWidgetState createState() => _SlidingPopupWidgetState();
}

class _SlidingPopupWidgetState extends State<SlidingPopupWidget>
    with TickerProviderStateMixin {
  Animation<Offset> openAnimation;
  Animation<double> opacityAnimation;
  AnimationController animationController;
  AnimationController opacityController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    opacityController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    openAnimation = Tween<Offset>(
      begin: Offset(widget.width, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: opacityController,
      curve: Curves.easeInOut,
    ));

    Future<void>.delayed(Duration(milliseconds: 100), () {
      opacityController.forward();
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Material(
      color: Colors.black26,
      child: FadeTransition(
        opacity: opacityAnimation,
        child: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              SlideTransition(
                position: openAnimation,
                child: Container(
                  color: widget.backgroundColor,
                  width: widget.width,
                  height: mediaQuery.size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        height: 44,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  widget.onCancel();
                                },
                                child: Container(
                                  color: Colors.white,
                                  height: 44,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        widget.cancelText,
                                        style: semiBoldLabelTextStyle(
                                            15, enabledBtnBGColor),
                                      ),
                                    ),
                                  ),
                                )),
                            Text(
                              widget.title,
                              style:
                                  boldLabelTextStyle(17, defaultFieldTextColor),
                            ),
                            InkWell(
                                onTap: () {
//                                  animationController.reverse();
//                                  opacityController.reverse();
                                  widget.onSave();
//                                  Future<void>.delayed(
//                                      Duration(milliseconds: 200), () {
//                                    //Navigator.pop(context);
//                                  });
                                },
                                child: Container(
                                  color: Colors.white,
                                  height: 44,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        widget.doneText,
                                        style: semiBoldLabelTextStyle(
                                            15, enabledBtnBGColor),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: separatorColor,
                      ),
                      Expanded(
                          child: AnimatedContainer(
                              color: widget?.backgroundColor ?? bgColor,
                              padding: mediaQuery.viewInsets,
                              duration: const Duration(milliseconds: 300),
                              child:
                                  SizedBox.fromSize(child: this.widget.child)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

//    return Dialog(
//      elevation: 0,
//      child: ClipRRect(
//        borderRadius: BorderRadius.circular(13),
//        child: Container(
//          width: 675,
//          decoration: BoxDecoration(
//            color: enabledBtnTextColor,
//          ),
//          child: IntrinsicHeight(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Container(
//                  height: 56,
//                  child: Padding(
//                    padding: const EdgeInsets.all(16.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        InkWell(
//                            onTap: () {
//                              Navigator.pop(context);
//                            },
//                            child: Images.instance.crossBig()),
//                        Text(
//                          widget.title,
//                          style: boldLabelTextStyle(17, defaultFieldTextColor),
//                        ),
//                        Container(
//                          height: 20,
//                          width: 20,
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//                Container(
//                  height: 1,
//                  color: separatorColor,
//                ),
//                this.widget.child
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
  }
}


