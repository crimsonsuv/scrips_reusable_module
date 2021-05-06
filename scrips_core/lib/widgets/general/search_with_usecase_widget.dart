import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead_web/cupertino_flutter_typeahead.dart';
import 'package:scrips_core/common/domain/usecases/query_params.dart';
import 'package:scrips_core/common/domain/usecases/searchable_use_case.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class SearchWithUseCaseWidget extends StatefulWidget {
  SearchWithUseCaseWidget(
      {Key key,
      this.useCase,
      this.onSelected,
      this.text,
      this.placeholder,
      this.showIcon = true,
      this.groupName})
      : super(key: key);

  final SearchableUseCase useCase;
  final String text;
  final String groupName;
  final String placeholder;
  final Function onSelected;
  final bool showIcon;

  @override
  _SearchWithUseCaseWidgetState createState() =>
      _SearchWithUseCaseWidgetState();
}

class _SearchWithUseCaseWidgetState extends State<SearchWithUseCaseWidget> {
  TextEditingController textEditingController;

  @override
  void dispose() async {
    textEditingController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if (widget.showIcon)
              Row(
                children: <Widget>[
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: ScripsIcons.instance
                          .icon(ScripsIcons.search, color: Color(0xffdadada))),
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                  ),
                ],
              ),
            Expanded(
              child: CupertinoTypeAheadFormField(
                hideOnEmpty: true,
                hideSuggestionsOnKeyboardHide: false,
                keepSuggestionsOnLoading: false,
                suggestionsBoxVerticalOffset: 10,
                debounceDuration: Duration(milliseconds: 200),
                hideOnError: true,
                loadingBuilder: (context) {
                  return Container(
                    height: 100,
                    child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                enabledBtnBGColor),
                          )),
                    ),
                  );
                },
                textFieldConfiguration: CupertinoTextFieldConfiguration(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                    autofocus: true,
                    style: lightLabelTextStyle(15, regularTextColor,
                        height: 1, letterSpacing: -0.24),
                    controller: textEditingController,
                    decoration: BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    placeholder: "Search ${widget.placeholder}",
                    onChanged: (value) {}),
                suggestionsCallback: (pattern) async {
                  final result = await widget.useCase(
                      QueryParams(query: pattern, searchFor: widget.groupName));
                  return result.fold(
                    (error) => [],
                    (success) => success,
                  );
                },
                itemBuilder: (context, prediction) {
                  return Listener(
                    child: Material(
                      child: ListTile(
                        title: Text(
                          prediction?.title ?? "n/a",
                          style: normalLabelTextStyle(15, regularTextColor),
                        ),
                      ),
                    ),
                    onPointerDown: (_) => null,
                  );
                },
                onSuggestionSelected: (prediction) {
                  //textEditingController.text = prediction.title;
                  widget.onSelected(prediction);
                  // Navigator.pop(context);
                },
              ),
            ),
            if (textEditingController.text != null &&
                textEditingController.text.isNotEmpty)
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 6)),
                  ScripsIcons.instance.iconInkWell(ScripsIcons.cancelled,
                      size: 24, color: Color(0xffdadada), callback: () {
                    textEditingController.clear();
                    widget.onSelected(null);
                  })
                ],
              ),
          ],
        ),
      ),
    );
  }
}
