import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/space.dart';

enum ListCount { TEN, TWENTY, FIFTY }

ListCount intToCount(int count) {
  if (count == 10) {
    return ListCount.TEN;
  } else if (count == 20) {
    return ListCount.TWENTY;
  } else if (count == 50) {
    return ListCount.FIFTY;
  }
  return ListCount.TEN;
}

int countToInt(ListCount count) {
  if (count == ListCount.TEN) {
    return 10;
  } else if (count == ListCount.TWENTY) {
    return 20;
  } else if (count == ListCount.FIFTY) {
    return 50;
  }
  return 10;
}

class CustomTableListWidget extends StatefulWidget {
  final List<TableListTitle> headerList;
  final List<List<MenuOptions>> menuOptions;
  final List<Widget> editModeWidgetRow;
  final List<List<Widget>> rowDataList;
  final bool showPagingOptions;
  final bool showThreeDotItemOption;
  final bool isSingleSelection;
  final bool showSortingOption;
  final ListCount pageItemCount;
  final int currentPage;
  final int lastPage;
  final int totalItems;
  final TableListTitle selectedHeader;
  final List<int> selectedItems;
  final String currentTime;
  final Function onItemSelection;
  final Function onAllSelection;
  final Function onItemClick;
  final Function onPageCountSelection;
  final Function onHeaderClick;
  final Function onNextPage;
  final Function onPreviousPage;
  final Function onPageClick;
  final bool showSelectionOption;
  final List<int> editModeIndexs;
  final EdgeInsets padding;
  final Color rowColor;

  CustomTableListWidget(
      {@required this.headerList,
      @required this.rowDataList,
      @required this.menuOptions,
      @required this.selectedItems,
        this.editModeWidgetRow,
      this.onItemClick,
      this.onAllSelection,
      this.selectedHeader,
      this.currentTime = "",
      this.onHeaderClick,
        this.showSortingOption = true,
      this.showPagingOptions = false,
      this.showThreeDotItemOption = false,
      this.isSingleSelection = false,
      this.showSelectionOption = true,
      this.pageItemCount = ListCount.TEN,
      this.onItemSelection,
      this.currentPage = 1,
      this.lastPage = 1,
      this.onPageCountSelection,
      this.onNextPage,
      this.onPreviousPage,
      this.onPageClick,
      this.totalItems = 0,
        this.rowColor,
        this.padding = const EdgeInsets.symmetric(horizontal: 16),
        this.editModeIndexs = const []});

  @override
  _CustomTableListWidgetState createState() => _CustomTableListWidgetState();
}

class TableListTitle {
  String title;
  double width;

  TableListTitle({this.title, this.width});
}

class MenuOptions {
  String title;
  Widget icon;
  Function onClick;
  Color color;

  MenuOptions({this.title, this.icon, this.onClick, this.color = Colors.black});
}

class _CustomTableListWidgetState extends State<CustomTableListWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Widget> headerRowWidget() {
    List<Widget> dataList = [];
    dataList.add(
      (widget.showSelectionOption)
          ? (widget.isSingleSelection)
              ? Container(
                  height: 16,
                  width: 16,
                )
              : InkWell(
                  onTap: () => {widget.onAllSelection()},
                  child: Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: (widget?.selectedItems?.length ==
                                    widget.rowDataList.length &&
                                widget.rowDataList.length > 0)
                            ? enabledBtnBGColor
                            : Colors.transparent,
                        border: Border.all(
                            color: (widget?.selectedItems?.length ==
                                    widget.rowDataList.length)
                                ? enabledBtnBGColor
                                : Colors.grey)),
                    child: Icon(
                      Icons.check,
                      color: (widget?.selectedItems?.length ==
                              widget.rowDataList.length)
                          ? bgColor
                          : Colors.transparent,
                      size: 12,
                    ),
                  ),
                )
          : Container(),
    );
    dataList.add(Space(
      horizontal: 16,
    ));
    widget.headerList.forEach((data) {
      if (data.title == "" || data.title == null) {
        dataList.add(Container(
          width: data.width,
        ));
      } else {
        dataList.add(Container(
          width: data.width,
          child: InkWell(
            onTap: () {
              widget.onHeaderClick(data);
            },
            child: Row(
              children: <Widget>[
                Text(
                  "${data.title}".toUpperCase(),
                  style: boldLabelTextStyle(14, textInputColor),
                ),
                (widget.showSortingOption) ? Row(
                  children: [
                    Space(
                      horizontal: 4,
                    ),
                    (widget.selectedHeader == data)
                        ? Images.instance.listSortEnabled()
                        : Images.instance.listSortIcon(),
                  ],
                ): Container()
              ],
            ),
          ),
        ));
      }
      dataList.add(Space(
        horizontal: 13,
      ));
    });
    return dataList;
  }

  List<Widget> itemRowWidget(index) {
    List<Widget> dataList = [];
    if (widget.showSelectionOption) {
      dataList.add(
        InkWell(
          onTap: () => {widget.onItemSelection(index)},
          child: Container(
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
            child: Center(
              child: Icon(
                Icons.check,
                color: (widget.selectedItems
                            .where((data) => data == index)
                            .toList()
                            .length >
                        0)
                    ? bgColor
                    : Colors.transparent,
                size: 12,
              ),
            ),
          ),
        ),
      );
    }

    dataList.add(Space(
      horizontal: (widget.editModeIndexs.contains(index)) ? 8 : 16,
    ));
    if(widget.editModeIndexs.contains(index)){
      dataList.add(Row(
        children: widget.editModeWidgetRow,
      ));
    } else {
      widget.headerList.forEach((data) {
        dataList.add(Row(
          children: <Widget>[
            Container(
              width: data.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: widget.rowDataList[index][widget.headerList.indexOf(data)],
                  ),
                ],
              ),
            ),
          ],
        ));
        dataList.add(Space(
          horizontal: 13,
        ));
      });
    }

    if (widget.showThreeDotItemOption && (widget?.menuOptions?.length ?? 0) > 0 && !widget.editModeIndexs.contains(index)) {
      if (((widget?.menuOptions[index]?.length ?? 0) > 0)) {
        dataList.add(PopupMenuButton<String>(
          onSelected: (String value) {
            final selectedItem = widget.menuOptions[index]
                .where((data) => data.title == value)
                .toList();
            if (selectedItem.length > 0) {
              selectedItem.first.onClick(index);
            }
          },
          child: Container(
            child: Images.instance.moreGreyIcon(height: 24, width: 24),
          ),
          itemBuilder: (BuildContext context) => menuOptionsList(index),
        ));
      } else {
        dataList.add(Container(
          width: 24,
        ));
      }
    }
    return dataList;
  }

  List<PopupMenuEntry<String>> menuOptionsList(index) {
    List<PopupMenuEntry<String>> optionList = [];
    widget.menuOptions[index].forEach((data) {
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
        dataList.add(Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color:
              (index % 2 == 0) ? ((widget.rowColor != null) ? widget.rowColor : enabledBtnTextColor) : Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
            child: InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                widget.onItemClick(index);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: itemRowWidget(index),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: widget.padding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Space(
                          horizontal: 13,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: headerRowWidget(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: itemsList(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          (widget.showPagingOptions)
              ? (widget.totalItems == 0)
                  ? Container()
                  : Column(
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
                                        InkWell(
                                          onTap: () {
                                            widget.onPageCountSelection(10);
                                          },
                                          child: Text(
                                            "10",
                                            style: (widget.pageItemCount ==
                                                    ListCount.TEN)
                                                ? boldLabelTextStyle(
                                                    13, enabledBtnBGColor)
                                                : normalLabelTextStyle(
                                                    13, regularTextColor),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            widget.onPageCountSelection(20);
                                          },
                                          child: Text(
                                            "20",
                                            style: (widget.pageItemCount ==
                                                    ListCount.TWENTY)
                                                ? boldLabelTextStyle(
                                                    13, enabledBtnBGColor)
                                                : normalLabelTextStyle(
                                                    13, regularTextColor),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            widget.onPageCountSelection(50);
                                          },
                                          child: Text(
                                            "50",
                                            style: (widget.pageItemCount ==
                                                    ListCount.FIFTY)
                                                ? boldLabelTextStyle(
                                                    13, enabledBtnBGColor)
                                                : normalLabelTextStyle(
                                                    13, regularTextColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Space(
                                  horizontal: 24,
                                ),
                                Text(
                                  "${((widget.currentPage * countToInt(widget.pageItemCount)) - countToInt(widget.pageItemCount)) + 1}-${(widget.currentPage * countToInt(widget.pageItemCount)) > widget.totalItems ? widget.totalItems : (widget.currentPage * countToInt(widget.pageItemCount))} of ${widget.totalItems} records",
                                  style: normalLabelTextStyle(
                                      13, regularTextColor),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        (widget.currentPage > 1) ? InkWell(
                                            onTap: () {
                                                widget.onPreviousPage();
                                            },
                                            child: (widget.currentPage > 1)
                                                ? Images.instance.smallBack()
                                                : Images.instance
                                                    .smallBackGrey()) : Images.instance
                                            .smallBackGrey(),
                                        Row(
                                          children: pageWidgetList(),
                                        ),
                                        (widget.currentPage <
                                            widget.lastPage) ? InkWell(
                                            onTap: () {
                                                widget.onNextPage();
                                            } ,
                                            child: (widget.currentPage <
                                                    widget.lastPage)
                                                ? Images.instance.smallForward()
                                                : Images.instance
                                                    .smallForwardGrey()) : Images.instance
                                            .smallForwardGrey(),
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
    );
  }

  List<Widget> pageWidgetList() {
    List<Widget> pageListItem = [];
    pageListItem.add(Space(
      horizontal: 8,
    ));
    if (widget.lastPage <= 4) {
      for (int i = 1; i <= widget.lastPage; i++) {
        pageListItem.add(InkWell(
          onTap: () {
            widget.onPageClick(i);
          },
          child: Container(
            width: 24,
            child: Center(
              child: Text(
                "$i",
                style: (widget.currentPage == i)
                    ? boldLabelTextStyle(13, enabledBtnBGColor)
                    : normalLabelTextStyle(13, regularTextColor),
              ),
            ),
          ),
        ));
        pageListItem.add(Space(
          horizontal: 8,
        ));
      }
      return pageListItem;
    }
    else {
      if (widget.currentPage <= 2) {
        for (int i = 1; i <= 2; i++) {
          pageListItem.add(InkWell(
            onTap: () {
              widget.onPageClick(i);
            },
            child: Container(
                width: 24,
                child: Center(
                  child: Text(
                    "$i",
                    style: (widget.currentPage == i)
                        ? boldLabelTextStyle(13, enabledBtnBGColor)
                        : normalLabelTextStyle(13, regularTextColor),
                  ),
                )),
          ));
          pageListItem.add(Space(
            horizontal: 16,
          ));
        }
        pageListItem.add(Container(
          width: 24,
          child: Text(
            "...",
            style: boldLabelTextStyle(13, regularTextColor),
          ),
        ));
        pageListItem.add(Space(
          horizontal: 16,
        ));
        pageListItem.add(InkWell(
          onTap: () {
            widget.onPageClick(widget.lastPage);
          },
          child: Container(
            child: Center(
              child: Text(
                "${widget.lastPage}",
                style: boldLabelTextStyle(13, regularTextColor),
              ),
            ),
          ),
        ));
        pageListItem.add(Space(
          horizontal: 8,
        ));
        return pageListItem;
      }
      if (widget.currentPage >= widget.lastPage - 2) {
        pageListItem.add(InkWell(
          onTap: () {
            widget.onPageClick(1);
          },
          child: Container(
            width: 24,
            child: Center(
              child: Text(
                "1",
                style: boldLabelTextStyle(13, regularTextColor),
              ),
            ),
          ),
        ));
        pageListItem.add(Space(
          horizontal: 16,
        ));
        pageListItem.add(Container(
          width: 24,
          child: Center(
            child: Text(
              "...",
              style: boldLabelTextStyle(13, regularTextColor),
            ),
          ),
        ));
        for (int i = widget.lastPage - 2; i <= widget.lastPage; i++) {
          pageListItem.add(InkWell(
            onTap: () {
              widget.onPageClick(i);
            },
            child: Container(
                child: Center(
              child: Text(
                "$i",
                style: (widget.currentPage == i)
                    ? boldLabelTextStyle(13, enabledBtnBGColor)
                    : normalLabelTextStyle(13, regularTextColor),
              ),
            )),
          ));
          pageListItem.add(Space(
            horizontal: 8,
          ));
        }
        return pageListItem;
      }
      if (widget.currentPage > 2 && widget.currentPage < widget.lastPage - 2) {
        pageListItem.add(InkWell(
          onTap: () {
            widget.onPageClick(1);
          },
          child: Container(
            width: 24,
            child: Center(
              child: Text(
                "1",
                style: boldLabelTextStyle(13, regularTextColor),
              ),
            ),
          ),
        ));
        pageListItem.add(Space(
          horizontal: 16,
        ));
        pageListItem.add(Container(
          width: 24,
          child: Center(
            child: Text(
              "...",
              style: boldLabelTextStyle(13, regularTextColor),
            ),
          ),
        ));
        for (int i = widget.currentPage - 1; i <= widget.currentPage + 2; i++) {
          pageListItem.add(InkWell(
            onTap: () {
              widget.onPageClick(i);
            },
            child: Container(
              child: Center(
                child: Text(
                  "$i",
                  style: (widget.currentPage == i)
                      ? boldLabelTextStyle(13, enabledBtnBGColor)
                      : normalLabelTextStyle(13, regularTextColor),
                ),
              ),
            ),
          ));
          pageListItem.add(Space(
            horizontal: 16,
          ));
        }
        pageListItem.add(Container(
          width: 24,
          child: Center(
            child: Text(
              "...",
              style: boldLabelTextStyle(13, regularTextColor),
            ),
          ),
        ));
        pageListItem.add(Space(
          horizontal: 16,
        ));
        pageListItem.add(InkWell(
          onTap: () {
            widget.onPageClick(widget.lastPage);
          },
          child: Container(
            child: Center(
              child: Text(
                "${widget.lastPage}",
                style: boldLabelTextStyle(13, regularTextColor),
              ),
            ),
          ),
        ));
        pageListItem.add(Space(
          horizontal: 8,
        ));
        return pageListItem;
      }
      return [Container()];
    }
  }
}
