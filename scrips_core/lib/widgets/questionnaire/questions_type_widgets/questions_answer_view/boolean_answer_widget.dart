import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/answer_icons_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/answer_top_buttons_widget.dart';
import 'package:scrips_shared_features/features/scheduling_module/data/datamodels/questionnaire_model.dart' as questionnaire;
import 'package:scrips_shared_features/features/scheduling_module/data/datamodels/questionnaire_response_model.dart'
as questionnaireResponse;

class BooleanAnswerWidget extends StatefulWidget {
  BooleanAnswerWidget(
      {Key key,
      this.showButtons = true,
      this.questionItem,
      this.onEdit,
      this.onDelete, this.onChanged, this.answerItem, this.isResponseView = true})
      : super(key: key);
  final bool showButtons;
  final questionnaire.Item questionItem;
  final Function onEdit;
  final Function onDelete;
  final questionnaireResponse.Item answerItem;
  final Function onChanged;
  final isResponseView;

  @override
  _BooleanAnswerWidgetState createState() => _BooleanAnswerWidgetState();
}

class _BooleanAnswerWidgetState extends State<BooleanAnswerWidget> {
  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: enabledBtnTextColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: widget.showButtons ? EdgeInsets.all(24) : EdgeInsets.all(0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              widget.showButtons
                  ? Column(
                      children: <Widget>[
                        !widget.isResponseView ?  AnswerTopButtonsWidget(
                          image: Image.network(
                              "${widget?.questionItem?.groups?.icon ?? ""}"),
                          onEdit: widget.onEdit,
                          onDelete: widget.onDelete,
                          title:
                              "${widget?.questionItem?.groups?.name ?? "N/A"}"
                                  .toUpperCase(),
                        ) :
    AnswerIconWidget(
        image: Image.network(
        "${widget?.questionItem?.groups?.icon ?? ""}"),
    title:
    "${widget?.questionItem?.groups?.name ?? "N/A"}"
        .toUpperCase(),
    ),
                        Space(
                          vertical: 24,
                        ),
                      ],
                    )
                  : Container(),
              Row(
                children: <Widget>[
                  Text(
                    "${widget?.questionItem?.text ?? ""}",
                    style: normalLabelTextStyle(17, regularTextColor),
                  ),
                  (widget?.questionItem?.required ?? false)
                      ? Text(
                          ' *',
                          style: normalLabelTextStyle(
                              17, defaultValidationTextColor),
                          textAlign: TextAlign.start,
                        )
                      : Container()
                ],
              ),
              Space(
                vertical: 20,
              ),
              IgnorePointer(
                ignoring: !widget.isResponseView,
                child: Tags(
                  spacing: 8,
                  columns: 5,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  symmetry: false,
                  itemCount: 2,
                  itemBuilder: (int index) {
                    return ItemTags(
                      index: index,
                      // required
                      elevation: 0,
                      padding:
                      EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                      title: index == 0 ? "Yes" : "No",
                      textColor: regularTextColor,
                      textActiveColor: enabledBtnTextColor,
                      color: bgColor,
                      activeColor: enabledBtnBGColor,
                      border: Border.all(width: 0, color: Colors.transparent),
                      active: index == 0
                          ? (widget?.answerItem?.answer?.valueBoolean == true)
                          : (widget?.answerItem?.answer?.valueBoolean == false),
                      textStyle: normalLabelTextStyle(15, regularTextColor),
                      combine: ItemTagsCombine.withTextBefore,
                      // OR null,
                      onPressed: (widget.onChanged == null) ? null : (item) {
                        widget?.answerItem?.answer?.valueBoolean = (index == 0);
                        widget.onChanged(widget.answerItem);
                      },
                      onLongPressed: (item) => print(item),
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
