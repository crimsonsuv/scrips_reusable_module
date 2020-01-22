import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class SlidingPopupWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final double width;
  final Function onSave;
  final Color backgroundColor;

  SlidingPopupWidget(
      {this.title,
      this.child,
      @required this.width,
      this.onSave,
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
      duration: Duration(milliseconds: 300),
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
      curve: Curves.fastLinearToSlowEaseIn,
    ));

    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: opacityController,
      curve: Curves.easeIn,
    ));

    Future<void>.delayed(Duration(microseconds: 100), () {
      animationController.forward();
    });
    Future<void>.delayed(Duration(milliseconds: 100), () {
      opacityController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: FadeTransition(
        opacity: opacityAnimation,
        child: Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints.expand(),
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
                  color: Colors.white,
                  width: widget.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 44,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    animationController.reverse();
                                    opacityController.reverse();
                                    Future<void>.delayed(
                                        Duration(milliseconds: 300), () {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: semiBoldLabelTextStyle(
                                        15, enabledBtnBGColor),
                                  )),
                              Text(
                                widget.title,
                                style: boldLabelTextStyle(
                                    17, defaultFieldTextColor),
                              ),
                              InkWell(
                                  onTap: () {
                                    animationController.reverse();
                                    opacityController.reverse();
                                    widget.onSave();
                                    Future<void>.delayed(
                                        Duration(milliseconds: 300), () {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "Save",
                                    style: semiBoldLabelTextStyle(
                                        15, enabledBtnBGColor),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: separatorColor,
                      ),
                      Expanded(
                        child: Container(
                          color: widget.backgroundColor,
                          child: SingleChildScrollView(
                              child:
                                  SizedBox.fromSize(child: this.widget.child)),
                        ),
                      ),
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
