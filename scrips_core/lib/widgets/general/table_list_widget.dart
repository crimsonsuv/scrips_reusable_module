import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';

enum ListCount { TEN, TWENTY, FIFTY }

class TableListWidget extends StatefulWidget {
  final List<TableListTitle> headerList;
  final List<MenuOptions> menuOptions;
  final List<List<String>> rowDataList;
  final bool showPagingOptions;
  final bool showThreeDotItemOption;
  final ListCount pageItemCount;
  final int currentPage;
  final int lastPage;
  final int totalItems;
  final List<int> selectedItems;
  final Function onItemSelection;
  final Function onAllSelection;
  final Function onItemClick;

  TableListWidget(
      {@required this.headerList,
      @required this.rowDataList,
      @required this.menuOptions,
      @required this.selectedItems,
      this.onItemClick,
      this.onAllSelection,
      this.showPagingOptions = false,
      this.showThreeDotItemOption = false,
      this.pageItemCount = ListCount.TEN,
      this.onItemSelection,
      this.currentPage = 1,
      this.lastPage = 1,
      this.totalItems = 0});

  @override
  _TableListWidgetState createState() => _TableListWidgetState();
}

class TableListTitle {
  String title;
  double width;
  TableListTitle({this.title, this.width});
}

class MenuOptions {
  String title;
  Image icon;
  Function onClick;
  Color color;
  MenuOptions({this.title, this.icon, this.onClick, this.color = Colors.black});
}

class _TableListWidgetState extends State<TableListWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Widget> headerRowWidget() {
    List<Widget> dataList = [];
    dataList.add(
      Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: (widget?.selectedItems?.length == widget.rowDataList.length)
                ? enabledBtnBGColor
                : Colors.transparent,
            border: Border.all(
                color:
                    (widget?.selectedItems?.length == widget.rowDataList.length)
                        ? enabledBtnBGColor
                        : Colors.grey)),
        child: FlatButton(
          onPressed: () => {widget.onAllSelection()},
        ),
      ),
    );
    dataList.add(Space(
      horizontal: 24,
    ));
    widget.headerList.forEach((data) {
      dataList.add(Container(
        width: data.width,
        child: Row(
          children: <Widget>[
            Text(
              "${data.title}".toUpperCase(),
              style: boldLabelTextStyle(14, textInputColor),
            ),
            Space(
              horizontal: 4,
            ),
            Images.instance.listSortIcon()
          ],
        ),
      ));
      dataList.add(Space(
        horizontal: 24,
      ));
    });
    return dataList;
  }

  List<Widget> itemRowWidget(index) {
    List<Widget> dataList = [];
    dataList.add(
      Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: (widget.selectedItems
                        .where((data) => data == index)
                        .toList()
                        .length >
                    0)
                ? enabledBtnBGColor
                : Colors.transparent,
            border: Border.all(
                color: (widget.selectedItems
                            .where((data) => data == index)
                            .toList()
                            .length >
                        0)
                    ? enabledBtnBGColor
                    : Colors.grey)),
        child: FlatButton(
          onPressed: () => {widget.onItemSelection(index)},
        ),
      ),
    );
    dataList.add(Space(
      horizontal: 24,
    ));
    widget.headerList.forEach((data) {
      dataList.add(Row(
        children: <Widget>[
          Container(
            width: data.width,
            child: Row(
              children: <Widget>[
                (data.title == "Name")
                    ? Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              color: Colors.black12,
                              height: 24,
                              width: 24,
                            ),
                          ),
                          Space(
                            horizontal: 16,
                          ),
                        ],
                      )
                    : Container(),
                Expanded(
                  child: Text(
                    "${widget.rowDataList[index][widget.headerList.indexOf(data)]}",
                    maxLines: 1,
                    style: normalLabelTextStyle(14, regularTextColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
      dataList.add(Space(
        horizontal: 24,
      ));
    });
    if (widget.showThreeDotItemOption) {
      dataList.add(PopupMenuButton<String>(
        onSelected: (String value) {
          final selectedItem =
              widget.menuOptions.where((data) => data.title == value).toList();
          if (selectedItem.length > 0) {
            selectedItem.first.onClick(index);
          }
        },
        child: Container(
          child: Images.instance.moreGreyIcon(),
        ),
        itemBuilder: (BuildContext context) => menuOptionsList(),
      ));
    }
    return dataList;
  }

  List<PopupMenuEntry<String>> menuOptionsList() {
    List<PopupMenuEntry<String>> optionList = [];
    widget.menuOptions.forEach((data) {
      optionList.add(PopupMenuItem<String>(
        value: data.title,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              data.title,
              style: normalLabelTextStyle(16.0, data.color),
            ),
            data.icon
          ],
        ),
      ));
    });
    return optionList;
  }

  List<Widget> itemsList() {
    List<Widget> dataList = [];
    for (int index = 0; index < widget.rowDataList.length; index++) {
      dataList.add(SizedBox(
        height: 40,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color:
                  (index % 2 == 0) ? enabledBtnTextColor : Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: InkWell(
              onTap: () {
                widget.onItemClick(index);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: itemRowWidget(index),
              ),
            ),
          ),
        ),
      ));
    }
    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: headerRowWidget(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: itemsList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            (widget.showPagingOptions)
                ? Column(
                    children: <Widget>[
                      Space(
                        vertical: 12,
                      ),
                      Container(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 32,
                                width: 104,
                                decoration: BoxDecoration(
                                    color: enabledBtnTextColor,
                                    borderRadius: BorderRadius.circular(13)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "10",
                                        style: (widget.pageItemCount ==
                                                ListCount.TEN)
                                            ? boldLabelTextStyle(
                                                13, enabledBtnBGColor)
                                            : normalLabelTextStyle(
                                                13, regularTextColor),
                                      ),
                                      Text(
                                        "20",
                                        style: (widget.pageItemCount ==
                                                ListCount.TWENTY)
                                            ? boldLabelTextStyle(
                                                13, enabledBtnBGColor)
                                            : normalLabelTextStyle(
                                                13, regularTextColor),
                                      ),
                                      Text(
                                        "50",
                                        style: (widget.pageItemCount ==
                                                ListCount.FIFTY)
                                            ? boldLabelTextStyle(
                                                13, enabledBtnBGColor)
                                            : normalLabelTextStyle(
                                                13, regularTextColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Space(
                                horizontal: 24,
                              ),
                              Text(
                                "1-10 of ${widget.totalItems} records",
                                style:
                                    normalLabelTextStyle(13, regularTextColor),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                height: 32,
                                decoration: BoxDecoration(
                                    color: enabledBtnTextColor,
                                    borderRadius: BorderRadius.circular(13)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Images.instance.smallBack(),
                                      Space(
                                        horizontal: 16,
                                      ),
                                      Container(
                                        width: 24,
                                        child: Text(
                                          "${widget.currentPage.toString()}",
                                          style: boldLabelTextStyle(
                                              13, enabledBtnBGColor),
                                        ),
                                      ),
                                      Space(
                                        horizontal: 16,
                                      ),
                                      Container(
                                        width: 24,
                                        child: Text(
                                          "${(widget.currentPage + 1).toString()}",
                                          style: normalLabelTextStyle(
                                              13, regularTextColor),
                                        ),
                                      ),
                                      Space(
                                        horizontal: 16,
                                      ),
                                      Container(
                                        width: 24,
                                        child: Text(
                                          "...",
                                          style: normalLabelTextStyle(
                                              13, regularTextColor),
                                        ),
                                      ),
                                      Space(
                                        horizontal: 16,
                                      ),
                                      Container(
                                        width: 24,
                                        child: Text(
                                          "${widget.lastPage.toString()}",
                                          style: normalLabelTextStyle(
                                              13, regularTextColor),
                                        ),
                                      ),
                                      Space(
                                        horizontal: 16,
                                      ),
                                      Images.instance.smallForward(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
