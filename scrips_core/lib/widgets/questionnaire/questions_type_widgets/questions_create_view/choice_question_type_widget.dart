import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/make_question_mandatory_switch_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/patient_facing_info_view.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/questions_common_buttons_widget.dart';
import 'package:scrips_shared_features/features/scheduling_module/data/datamodels/questionnaire_model.dart' as questionnaire;

class ChoiceQuestionTypeWidget extends StatefulWidget {
  ChoiceQuestionTypeWidget(
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
  _ChoiceQuestionTypeWidgetState createState() =>
      _ChoiceQuestionTypeWidgetState();
}

class _ChoiceQuestionTypeWidgetState extends State<ChoiceQuestionTypeWidget> {
  questionnaire.Item initialData;
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FieldAndLabel(
              isMandatory: true,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              fieldBackgroundColor: textFieldBGcolor,
              fieldTextColor: textInputColor,
              fieldType: FieldType.TextField,
              labelTextStyle: defaultFieldLabelStyle(null, null),
              labelValue: "QUESTION".toUpperCase(),
              fieldValue: widget?.questionItem?.text ?? "",
              maxLength: 100,
              onChanged: (value, FieldAndLabelState state) {
                widget.questionItem.text = value;
              },
              validationMessage: (widget?.questionItem?.text ?? "").length == 0
                  ? "Please enter question"
                  : "",
              placeholder: "Enter question",
              axis: Axis.vertical,
              enabled: true,
            ),
            Space(
              vertical: 24,
            ),
            FieldAndLabel(
              isMandatory: true,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              fieldBackgroundColor: textFieldBGcolor,
              fieldTextColor: textInputColor,
              fieldType: FieldType.ValueSetPicker,
              valueSetGroup: widget?.questionItem?.groups?.name ?? "",
              labelTextStyle: defaultFieldLabelStyle(null, null),
              labelValue: "OPTIONS".toUpperCase(),
              fieldValue: "",
              validationMessage:
                  (widget?.questionItem?.answerOptions?.length ?? 0) < 2
                      ? "Please provide atleast two option"
                      : "",
              maxLength: 100,
              onChanged: (value, FieldAndLabelState state) {
                questionnaire.AnswerOption option =
                    questionnaire.AnswerOption.fromJson(value.toJson());
                if (widget.questionItem.answerOptions
                        .where((data) =>
                            data.valueCoding.code == option.valueCoding.code)
                        .toList()
                        .length ==
                    0) {
                  widget.questionItem.answerOptions.add(option);
                }
                widget.onChanged(widget.questionItem);
              },
              placeholder: "Enter option",
              axis: Axis.vertical,
              enabled: true,
            ),
            Space(
              vertical: 8,
            ),
            Text(
              "Type to search gender options.",
              style: semiBoldLabelTextStyle(13, labelTextStyleTextColor),
            ),
            Space(
              vertical: 16,
            ),
            Tags(
              spacing: 8,
              columns: 5,
              runSpacing: 8,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              symmetry: false,
              itemCount: widget?.questionItem?.answerOptions?.length ?? 0,
              itemBuilder: (int index) {
                return ItemTags(
                  pressEnabled: false,
                  index: index, // required
                  elevation: 0,
                  padding:
                      EdgeInsets.only(left: 8, right: 6, top: 4, bottom: 4),
                  title:
                      "${widget?.questionItem?.answerOptions[index]?.valueCoding?.display}",
                  textColor: regularTextColor,
                  textActiveColor: enabledBtnTextColor,
                  color: bgColor,
                  activeColor: enabledBtnBGColor,
                  border: Border.all(width: 0, color: Colors.transparent),
                  active: false,
                  textStyle: normalLabelTextStyle(15, regularTextColor),
                  combine: ItemTagsCombine.withTextBefore, // OR null,
                  onPressed: (item) {},
                  onLongPressed: (item) => print(item),
                  removeButton: ItemTagsRemoveButton(
                      size: 20,
                      color: enabledBtnBGColor,
                      backgroundColor: separatorColor,
                      onRemoved: () {
                        widget.questionItem.answerOptions.removeAt(index);
                        widget.onChanged(widget.questionItem);
                        return true;
                      },
                      borderRadius: BorderRadius.circular(20)),
                );
              },
            ),
            Space(
              vertical: 24,
            ),
            PatientFacingInfoWidget(
              text: "Patient facing search",
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
                          if (widget.questionItem.text == "" ||
                              widget.questionItem.answerOptions.length < 2) {
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
