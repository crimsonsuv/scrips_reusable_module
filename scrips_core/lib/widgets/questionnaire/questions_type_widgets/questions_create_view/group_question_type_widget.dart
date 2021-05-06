import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/questions_common_buttons_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/questions_create_view/boolean_question_type_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/questions_create_view/choice_question_type_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/questions_create_view/open_choice_question_type_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/questions_create_view/string_question_type_widget.dart';
import 'package:scrips_shared_features/features/scheduling_module/data/datamodels/questionnaire_model.dart' as questionnaire;

class GroupQuestionTypeWidget extends StatefulWidget {
  GroupQuestionTypeWidget(
      {Key key,
      this.questionItem,
      this.onCancel,
      this.onRemove,
      this.onSave,
      this.onChanged})
      : super(key: key);
  final questionnaire.Item questionItem;
  final Function onCancel;
  final Function onRemove;
  final Function onSave;
  final Function onChanged;

  @override
  _GroupQuestionTypeWidgetState createState() =>
      _GroupQuestionTypeWidgetState();
}

class _GroupQuestionTypeWidgetState extends State<GroupQuestionTypeWidget> {
  int questionCount = 3;
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

  Widget questionWidgetItem(questionnaire.Item questionItem, index) {
    switch (questionItem.type) {
      case "String":
        return StringQuestionTypeWidget(
          questionItem: questionItem,
          showButtons: false,
          onCancel: (data) {
            data.isEdit = false;
            widget.questionItem.items[index] = data;
            widget.onChanged(widget.questionItem);
          },
          onChanged: (data) {
            questionItem = data;
            widget.onChanged(widget.questionItem);
          },
          onSave: (data) {
            questionItem = data;
            widget.onSave(widget.questionItem);
          },
        );
        break;
      case "Boolean":
        return BooleanQuestionTypeWidget(
          questionItem: questionItem,
          showButtons: false,
          onCancel: (data) {
            data.isEdit = false;
            widget.questionItem.items[index] = data;
            widget.onChanged(widget.questionItem);
          },
          onChanged: (data) {
            questionItem = data;
            widget.onChanged(widget.questionItem);
          },
          onSave: (data) {
            questionItem = data;
            widget.onSave(widget.questionItem);
          },
        );
        break;
      case "Choice":
        return ChoiceQuestionTypeWidget(
          questionItem: questionItem,
          showButtons: false,
          onCancel: (data) {
            data.isEdit = false;
            widget.questionItem.items[index] = data;
            widget.onChanged(widget.questionItem);
          },
          onChanged: (data) {
            questionItem = data;
            widget.onChanged(widget.questionItem);
          },
          onSave: (data) {
            questionItem = data;
            widget.onSave(widget.questionItem);
          },
        );
        break;
      case "OpenChoice":
        return OpenChoiceQuestionTypeWidget(
          questionItem: questionItem,
          showButtons: false,
          onCancel: (data) {
            data.isEdit = false;
            widget.questionItem.items[index] = data;
            widget.onChanged(widget.questionItem);
          },
          onChanged: (data) {
            questionItem = data;
            widget.onChanged(widget.questionItem);
          },
          onSave: (data) {
            questionItem = data;
            widget.onSave(widget.questionItem);
          },
        );
        break;
      case "Group":
        return GroupQuestionTypeWidget(
          questionItem: questionItem,
          onCancel: (data) {
            data.isEdit = false;
            widget.questionItem.items[index] = data;
            widget.onChanged(widget.questionItem);
          },
          onChanged: (data) {
            questionItem = data;
            widget.onChanged(widget.questionItem);
          },
          onSave: (data) {
            questionItem = data;
            widget.onSave(widget.questionItem);
          },
        );
        break;
      default:
        return Text('Un-identified question type', textScaleFactor: 2);
    }
  }

  bool validateChild(List<questionnaire.Item> childList) {
    if ((childList?.length ?? 0) == 0) {
      return false;
    }
    bool status = true;
    childList.forEach((data) {
      if (data.text.trim().length == 0) {
        status = false;
      }
      if (data.groups.name == "Choice" || data.groups.name == "OpenChoice") {
        if (data.answerOptions.length < 2) {
          status = false;
        }
      }
    });
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: enabledBtnTextColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(24),
            child: FieldAndLabel(
              isMandatory: true,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              fieldBackgroundColor: textFieldBGcolor,
              fieldTextColor: textInputColor,
              fieldType: FieldType.TextField,
              validationMessage: (widget?.questionItem?.text ?? "").length == 0
                  ? "Please enter group name"
                  : "",
              labelTextStyle: defaultFieldLabelStyle(null, null),
              labelValue: "GROUP NAME".toUpperCase(),
              fieldValue: widget?.questionItem?.text ?? "",
              maxLength: 100,
              onChanged: (value, FieldAndLabelState state) {
                widget.questionItem.text = value;
              },
              placeholder: "Enter name",
              axis: Axis.vertical,
              enabled: true,
            ),
          ),
          Container(
            height: 1,
            color: separatorColor,
          ),
          (questionCount == 0)
              ? Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Center(
                        child: Text(
                          "Drop Questions Here",
                          style:
                              normalLabelTextStyle(13, defaultFieldHintColor),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: separatorColor,
                    )
                  ],
                )
              : SizedBox.fromSize(
                  child: CustomScrollView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    slivers: <Widget>[
                      ReorderableSliverList(
                        delegate: ReorderableSliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              questionWidgetItem(
                                  widget.questionItem.items[index], index),
                              Container(
                                height: 1,
                                color: separatorColor,
                              )
                            ],
                          );
                        },
                            childCount:
                                widget?.questionItem?.items?.length ?? 0),
                        onReorder: (int oldIndex, int newIndex) {},
                        onNoReorder: (int index) {
                          //this callback is optional
                          debugPrint(
                              '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
                        },
                      )
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: QuestionCommonButtonsWidget(
              onCancel: () {
                widget.onCancel(initialData);
              },
              onRemove: widget.onRemove,
              onSave: () {
                if (widget.questionItem.text == "" ||
                    !validateChild(widget.questionItem.items)) {
                  widget.onChanged(widget.questionItem);
                  return;
                }
                widget.onSave(widget.questionItem);
              },
            ),
          ),
        ],
      ),
    );
  }
}
