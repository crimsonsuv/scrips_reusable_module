import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead_web/cupertino_flutter_typeahead.dart';
import 'package:scrips_core/common/domain/usecases/fetch_value_sets_use_case.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({
    Key key,
    this.groupName,
    this.onSelected,
  }) : super(key: key);
  final String groupName;
  final Function onSelected;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController textEditingController;
  FetchValueSetsUseCase fetchValueSetsUseCase;

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    fetchValueSetsUseCase = FetchValueSetsUseCase(repository: sl());
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
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
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
                          padding: EdgeInsets.only(left: 30),
                          autofocus: true,
                          style: lightLabelTextStyle(15, regularTextColor,
                              height: 1, letterSpacing: -0.24),
                          controller: textEditingController,
                          decoration: BoxDecoration(
                            color: searchBGColour,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          placeholder: "Search ${widget.groupName}",
                          onChanged: (value) {}),
                      suggestionsCallback: (pattern) async {
                        final result = await fetchValueSetsUseCase(
                            FetchValueSetsParams(request: {
                          "SearchText": pattern,
                          "SearchFor": widget.groupName,
                          "Country": ""
                        }));
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
                                prediction?.valueCoding?.display ?? "n/a",
                                style:
                                    normalLabelTextStyle(15, regularTextColor),
                              ),
                            ),
                          ),
                          onPointerDown: (_) => null,
                        );
                      },
                      onSuggestionSelected: (prediction) {
                        widget.onSelected(prediction);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    left: 4,
                    top: 0,
                    bottom: 0,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                            height: 24,
                            width: 24,
                            child: Images.instance.searchIcon()),
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
