import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';

class DropdownWidgetWithUseCase<T> extends StatefulWidget {
  DropdownWidgetWithUseCase(
      {Key key,
      this.useCase,
      this.onSelected,
      this.item,
      this.placeholder,
      this.showIcon = false,
      this.groupName})
      : super(key: key);

  final UseCase useCase;
  final T item;
  final String groupName;
  final String placeholder;
  final Function onSelected;
  final bool showIcon;

  @override
  _DropdownWidgetWithUseCaseState createState() =>
      _DropdownWidgetWithUseCaseState<T>();
}

class _DropdownWidgetWithUseCaseState<T>
    extends State<DropdownWidgetWithUseCase> {
  List<T> items = [];
  T selectedItem;

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    selectedItem = widget.item;
    if (items.isEmpty && widget.useCase != null) {
      widget.useCase(null).then((result) {
        var items = result.fold(
          (error) => [],
          (success) => success,
        );
        if (mounted) {
          setState(() {
            this.items = items;
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
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
              child: FieldAndLabel(
                isMandatory: false,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                fieldBackgroundColor: textFieldBGcolor,
                listItems: (items.length > 0)
                    ? (items
                        .map((item) => DropdownMenuItem(
                            value: item, child: Text(item.toString())))
                        .toList())
                    : null,
                fieldValue: selectedItem,
                fieldTextColor: textInputColor,
                fieldType: FieldType.DropDownList,
                placeholder: widget.placeholder,
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: widget.groupName?.toUpperCase() ?? "",
                onChanged: (value, FieldAndLabelState state) {
                  if (value != selectedItem) {
                    widget.onSelected(value);
                    setState(() {
                      selectedItem = value;
                    });
                  }
                },
                validationMessage: "",
                axis: Axis.vertical,
                enabled: true,
              ),
            ),
//            Padding(padding: EdgeInsets.only(left: 6)),
//            GestureDetector(
//                onTap: () {
//                  widget.onSelected(null);
//                  setState(() {
//                    selectedItem = null;
//                  });
//                },
//                child: SizedBox(
//                    height: 24,
//                    width: 24,
//                    child: ScripsIcons.instance.icon(ScripsIcons.cancelled,
//                        color: Color(0xffdadada)))),
          ],
        ),
      ),
    );
  }
}
