import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/make_question_mandatory_switch_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/patient_facing_info_view.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/questions_common_buttons_widget.dart';
import 'package:scrips_shared_features/features/scheduling_module/data/datamodels/questionnaire_model.dart' as questionnaire;


class BooleanQuestionTypeWidget extends StatefulWidget {
  BooleanQuestionTypeWidget(
      {Key key,
      this.showButtons = true,
      this.questionItem,
      this.onCancel,
      this.onRemove,
      this.onChanged,
      this.onSave})
      : super(key: key);
  final bool showButtons;
  final questionnaire.Item questionItem;
  final Function onCancel;
  final Function onRemove;
  final Function onSave;
  final Function onChanged;

  @override
  _BooleanQuestionTypeWidgetState createState() =>
      _BooleanQuestionTypeWidgetState();
}

class _BooleanQuestionTypeWidgetState extends State<BooleanQuestionTypeWidget> {
  questionnaire.Item initialData = questionnaire.Item();
  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialData = questionnaire.Item.fromJson(widget.questionItem.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: enabledBtnTextColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            FieldAndLabel(
              isMandatory: true,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              fieldBackgroundColor: textFieldBGcolor,
              fieldTextColor: textInputColor,
              fieldType: FieldType.TextField,
              labelTextStyle: defaultFieldLabelStyle(null, null),
              validationMessage: (widget?.questionItem?.text ?? "").length == 0
                  ? "Please enter question"
                  : "",
              labelValue: "QUESTION".toUpperCase(),
              fieldValue: widget?.questionItem?.text ?? "",
              maxLength: 100,
              onChanged: (value, FieldAndLabelState state) {
                widget.questionItem.text = value;
              },
              placeholder: "Enter question",
              axis: Axis.vertical,
              enabled: true,
            ),
            Space(
              vertical: 24,
            ),
            PatientFacingInfoWidget(
              text: "Patient facing yes or no selection",
            ),
            Space(
              vertical: 24,
            ),
            MakeQuestionMandatorySwitchWidget(
              status: widget?.questionItem?.required ?? false,
              onChange: (status) {
                widget.questionItem.required = status;
                widget.onChanged(widget.questionItem);
              },
            ),
            (widget.showButtons)
                ? Column(
                    children: <Widget>[
                      Space(
                        vertical: 24,
                      ),
                      QuestionCommonButtonsWidget(
                        onCancel: () {
                          widget.onCancel(initialData);
                        },
                        onRemove: widget.onRemove,
                        onSave: () {
                          if (widget.questionItem.text == "") {
                            widget.onChanged(widget.questionItem);
                            return;
                          }
                          widget.onSave(widget.questionItem);
                        },
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
