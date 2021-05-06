import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/answer_icons_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/answer_top_buttons_widget.dart';
import 'package:scrips_shared_features/features/scheduling_module/data/datamodels/questionnaire_model.dart'
    as questionnaire;
import 'package:scrips_shared_features/features/scheduling_module/data/datamodels/questionnaire_response_model.dart'
    as questionnaireResponse;

class StringAnswerWidget extends StatefulWidget {
  StringAnswerWidget(
      {Key key,
      this.showButtons = true,
      this.questionItem,
      this.onEdit,
      this.onDelete,
      this.onChanged,
      this.answerItem,
      this.isResponseView = true})
      : super(key: key);
  final bool showButtons;
  final questionnaire.Item questionItem;
  final Function onEdit;
  final Function onDelete;
  final Function onChanged;
  final questionnaireResponse.Item answerItem;
  final isResponseView;

  @override
  _StringAnswerWidgetState createState() => _StringAnswerWidgetState();
}

class _StringAnswerWidgetState extends State<StringAnswerWidget> {
  GlobalKey<FormState> stringAnswerKey = GlobalKey<FormState>();
  FocusNode stringAnswerFocus = FocusNode();

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          widget.showButtons
              ? Column(
                  children: <Widget>[
                    !widget.isResponseView
                        ? AnswerTopButtonsWidget(
                            image: Image.network("${widget?.questionItem?.groups?.icon ?? ""}"),
                            onEdit: widget.onEdit,
                            onDelete: widget.onDelete,
                            title: "${widget?.questionItem?.groups?.name ?? "N/A"}".toUpperCase(),
                          )
                        : AnswerIconWidget(
                            image: Image.network("${widget?.questionItem?.groups?.icon ?? ""}"),
                            title: "${widget?.questionItem?.groups?.name ?? "N/A"}".toUpperCase(),
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
                      style: normalLabelTextStyle(17, defaultValidationTextColor),
                      textAlign: TextAlign.start,
                    )
                  : Container()
            ],
          ),
          Space(
            vertical: 18,
          ),
          FieldAndLabel(
            key: stringAnswerKey,
            focusNode: stringAnswerFocus,
            isMandatory: (widget?.questionItem?.required ?? false),
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            fieldBackgroundColor: textFieldBGcolor,
            fieldTextColor: textInputColor,
            fieldType: FieldType.TextField,
            labelTextStyle: defaultFieldLabelStyle(null, null),
            labelValue: "Answer".toUpperCase(),
            fieldValue: "",
            maxLength: 100,
            onChanged: (value, FieldAndLabelState state) {
              widget?.answerItem?.answer?.valueString = value;
              widget.onChanged(widget.answerItem);
            },
            placeholder: "Enter answer",
            axis: Axis.vertical,
            enabled: widget.isResponseView,
          ),
        ]),
      ),
    );
  }
}
