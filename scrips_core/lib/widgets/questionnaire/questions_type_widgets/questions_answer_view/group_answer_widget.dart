import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/answer_icons_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/common/answer_top_buttons_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/questions_answer_view/boolean_answer_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/questions_answer_view/choice_answer_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/questions_answer_view/open_choice_answer_widget.dart';
import 'package:scrips_core/widgets/questionnaire/questions_type_widgets/questions_answer_view/string_answer_widget.dart';
import 'package:scrips_shared_features/features/scheduling_module/data/datamodels/questionnaire_model.dart' as questionnaire;
import 'package:scrips_shared_features/features/scheduling_module/data/datamodels/questionnaire_response_model.dart'
as questionnaireResponse;

class GroupAnswerWidget extends StatefulWidget {
  GroupAnswerWidget(
      {Key key,
      this.showButtons = true,
      this.questionItem,
      this.onEdit,
      this.onDelete, this.onChanged, this.answerItem, this.bloc, this.isResponseView = true})
      : super(key: key);
  final bool showButtons;
  final questionnaire.Item questionItem;
  final Function onEdit;
  final Function onDelete;
  final questionnaireResponse.Item answerItem;
  final dynamic bloc;
  final Function onChanged;
  final isResponseView;

  @override
  _GroupAnswerWidgetState createState() => _GroupAnswerWidgetState();
}

class _GroupAnswerWidgetState extends State<GroupAnswerWidget> {
  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget questionWidgetItem(questionnaire.Item questionItem,
      questionnaireResponse.Item responseItem) {
    switch (questionItem.type) {
      case "String":
        return StringAnswerWidget(
          questionItem: questionItem,
          answerItem: responseItem,
          isResponseView: widget.isResponseView,
          showButtons: false,
          onChanged: (widget.onChanged == null) ? null : (answer) {
            responseItem = answer;
            widget.onChanged(responseItem);
          },
        );

        break;
      case "Boolean":
        return BlocBuilder<Cubit<dynamic>, dynamic>(
          cubit: widget.bloc,
          builder: (context, state) {
            return BooleanAnswerWidget(
              showButtons: false,
              isResponseView: widget.isResponseView,
              questionItem: questionItem,
              answerItem: responseItem,
              onChanged: (widget.onChanged == null) ? null : (answer) {
                responseItem = answer;
                widget.onChanged(responseItem);
              },
            );
          },
        );
        break;
      case "Choice":
        return BlocBuilder<Cubit<dynamic>, dynamic>(
          cubit: widget.bloc,
          builder: (context, state) {
            return ChoiceAnswerWidget(
              showButtons: false,
              isResponseView: widget.isResponseView,
              questionItem: questionItem,
              answerItem: responseItem,
              onChanged: (widget.onChanged == null) ? null : (answer) {
                responseItem = answer;
                widget.onChanged(responseItem);
              },
            );
          },
        );
        break;
      case "OpenChoice":
        return BlocBuilder<Cubit<dynamic>, dynamic>(
          cubit: widget.bloc,
          builder: (context, state) {
            return OpenChoiceAnswerWidget(
              showButtons: false,
              isResponseView: widget.isResponseView,
              questionItem: questionItem,
              answerItem: responseItem,
              onChanged: (widget.onChanged == null) ? null : (answer) {
                responseItem = answer;
                widget.onChanged(responseItem);
              },
            );
          },
        );
        break;
      case "Group":
        return GroupAnswerWidget(
          bloc: widget.bloc,
          isResponseView: widget.isResponseView,
          questionItem: questionItem,
          answerItem: responseItem,
          onChanged: (widget.onChanged == null) ? null : (answer) {
            responseItem = answer;
            widget.onChanged(responseItem);
          },
        );
        break;
      default:
        return Text('Un-identified question type', textScaleFactor: 2);
    }
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  widget.showButtons
                      ? Column(
                          children: <Widget>[
                            !widget.isResponseView ? AnswerTopButtonsWidget(
                              image: Image.network(
                                  "${widget?.questionItem?.groups?.icon ?? ""}"),
                              onEdit: widget.onEdit,
                              onDelete: widget.onDelete,
                              title:
                                  "${widget?.questionItem?.groups?.name ?? "N/A"}"
                                      .toUpperCase(),
                            ):
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
                    ],
                  ),
                  Space(
                    vertical: 8,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: (widget?.questionItem?.items?.length ?? 0),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Space(
                              vertical: 24,
                            ),
                            questionWidgetItem(
                                widget?.questionItem?.items[index],
                                (widget?.answerItem != null) ? widget?.answerItem?.items[index] : null),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ]),
    );
  }
}
