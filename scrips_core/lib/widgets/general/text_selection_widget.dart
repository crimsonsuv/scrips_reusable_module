import 'package:flutter/material.dart';
import 'package:scrips_core/common/data/mixin/mixin.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/utils/helper/text_style_helper.dart';
import 'package:scrips_core/utils/item_selection_manager.dart';

typedef SelectionChanged<T> = void Function(T value, bool isSeleted);

class TextSelectionWidget<T extends TitleMixin> extends StatefulWidget {
  final SelectionChanged<T> onSelection;
  final ItemSelectionManager manager;

  TextSelectionWidget(this.manager, this.onSelection);

  @override
  State<StatefulWidget> createState() {
    return _TextSelectionWidgetState();
  }
}

class _TextSelectionWidgetState extends State<TextSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: getOptions(),
    );
  }

  List<Widget> getOptions() {
    List<Widget> options = [];

    for (int i = 0; i < widget.manager.options.length; i++) {
      var item = widget.manager.options[i];
      var isSelected = widget.manager.selectedOptionIndexes.contains(i);
      options.add(Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              widget.manager.toggleSelection(item);
              widget.onSelection(
                  item, widget.manager.selectedOptionIndexes.contains(i));
            });
          },
          child: Text(
            item.title ?? "",
            style: editTextHintTextStyle().copyWith(
                color: isSelected ? enabledBtnBGColor : Color(0xffB7B7B7),
                fontWeight: isSelected ? FontWeight.bold : null),
            maxLines: 1,
          ),
        ),
      ));
    }

    return options;
  }
}
