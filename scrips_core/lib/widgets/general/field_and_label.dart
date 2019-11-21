import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scrips_core/general/property_info.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';
//import 'package:zefyr/zefyr.dart';

final BoxDecoration _textViewAndLabelBorder = null; // BoxDecoration(border: Border.all(color: Colors.grey));
final double _textViewAndLabelMargin = 8.0;
final double _textViewAndLabelPadding = 8.0;

enum FieldType {
  TextField,
  DropDownList,
  List,
  RichText,
  RichTextEdit,
}

class FieldAndLabel<ListItemType> extends StatefulWidget {
  final FieldType fieldType;
  final Color labelTextColor;
  final TextStyle labelTextStyle;
  final TextStyle textFieldTextStyle;
  final Color labelBackgroundColor;
  final Color fieldBackgroundColor;
  final Color fieldTextColor;
  final String labelValue;
  final dynamic fieldValue;
  final PropertyInfo fieldProperty;
  final bool enabled;
  final double width;
  final Axis axis;
  final BoxDecoration boxDecoration;
  final EdgeInsets padding;
  final double margin;
  final bool isPassword;
  final bool wrapWithRow;
  final double spaceBetweenTitle;
  final String placeholder;
  final String validationMessage;
  final Function onChanged;
  final List<ListItemType> listItems;

  //
  FieldAndLabel (
      {Key key,
        this.labelValue,
        this.labelTextStyle,
        this.textFieldTextStyle,
        this.fieldValue,
        this.fieldProperty,
        this.onChanged,
        this.fieldType = FieldType.TextField,
        this.listItems,
        this.axis,
        this.enabled = true,
        this.boxDecoration,
        this.padding,
        this.margin,
        this.placeholder,
        this.validationMessage,
        this.spaceBetweenTitle,
        this.isPassword = false,
        this.width,
        this.labelTextColor,
        this.labelBackgroundColor,
        this.fieldBackgroundColor,
        this.fieldTextColor,
        this.wrapWithRow = true} )
      : super( key: key );

  //  _TextViewAndLabelState state;

  static _FieldAndLabelState of ( BuildContext context, {bool root = false} ) =>
      root
      ? context.rootAncestorStateOfType( const TypeMatcher<_FieldAndLabelState>( ) )
      : context.ancestorStateOfType( const TypeMatcher<_FieldAndLabelState>( ) );

  //
  @override
  _FieldAndLabelState createState ( ) {
    return _FieldAndLabelState( );
  }

  String getValue ( BuildContext context ) {
    return FieldAndLabel
        .of( context )
        .currentFieldValue;
  }

  String getValidationMessage ( BuildContext context ) {
    return FieldAndLabel
        .of( context )
        .currentValidationMessage;
  }
}

class _FieldAndLabelState extends State<FieldAndLabel> {
  //
  var currentFieldValue;
  String currentPlaceholder;
  String currentValidationMessage;
  TextEditingController _textEditController;

  //  ZefyrController _richTextEditController;
  //  FocusNode _richTextEditFocusNode;

  void initState ( ) {
    super.initState( );
    currentFieldValue =
    widget.fieldProperty != null ? widget.fieldProperty?.value : (widget.fieldValue ?? null);
    if ( widget.fieldType == FieldType.TextField ) {
      // a controller is needed to Set initial value for textfield
      _textEditController = TextEditingController( text: currentFieldValue );
    }
    else if ( widget.fieldType == FieldType.RichTextEdit ) {
      //      _richTextEditController = ZefyrController(widget.fieldValue);
      //      _richTextEditFocusNode = FocusNode();
      //
      //      _richTextEditController.addListener(() {
      //        dynamic value = _richTextEditController.document;
      //        onChangedInternal(value);
      //      });
    }
  }

  onChangedInternal ( value ) {
    debugPrint( value );
    setState( ( ) {
      currentFieldValue = value;
      if ( widget.fieldProperty != null ) {
        widget.fieldProperty.value = currentFieldValue;
      }
    } );
    if ( widget.onChanged != null ) {
      widget.onChanged( value );
    }
  }

  @override
  Widget build ( BuildContext context ) {
    if ( this.widget.wrapWithRow )
      return Row( children: <Widget>[buildContents( ),], );
    else
      return buildContents( );
  }

  Widget buildContents ( ) {
    return Expanded(
      child: Container(
        //      width: widget.width != null && widget.width > 0 ? widget.width : MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: widget.padding ?? EdgeInsets.all( 8.0 ),
              margin: EdgeInsets.all( widget.margin ?? _textViewAndLabelMargin ),
              decoration: widget.boxDecoration ?? _textViewAndLabelBorder,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    widget.labelValue != null && widget.labelValue.isNotEmpty
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: UIHelper.defaultLabelBoxDecoration(
                              widget.labelBackgroundColor ),
                          child: PlatformText(
                            widget.labelValue,
                            style: this.widget.labelTextStyle ??
                                   defaultLabelStyle( widget.labelTextColor,
                                                          widget.labelBackgroundColor ),
                            textAlign: TextAlign.start,
                            ),
                          ),
                        SizedBox(
                          height: _textViewAndLabelPadding / 2,
                          )
                      ],
                      )
                    : Container( ),
                    widget.validationMessage != null && widget.fieldType != FieldType.DropDownList
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: _textViewAndLabelPadding / 2,
                          ),
                        Container(
                            decoration: UIHelper.defaultLabelBoxDecoration(
                                widget.fieldBackgroundColor ),
                            child: PlatformText(
                              currentValidationMessage ?? widget.validationMessage ?? null,
                              style: defaultValidationStyle( null, null ),
                              ) ),
                        SizedBox(
                          height: _textViewAndLabelPadding / 2,
                          )
                      ],
                      )
                    : Container( ),
                    widget.fieldType == FieldType.TextField
                    ? Container(
                      decoration: new BoxDecoration(
                        color: widget.fieldBackgroundColor,
                        ),
                      child: PlatformTextField(
                        obscureText: widget.isPassword == false || widget.isPassword == null
                                     ? false
                                     : true,
                        style: defaultFieldStyle(
                            widget.fieldTextColor, widget.fieldBackgroundColor ),
                        textAlign: TextAlign.start,
                        enabled: widget.enabled ?? true,
                        controller: _textEditController,
                        onChanged: onChangedInternal,
                        decoration: InputDecoration.collapsed(
                          hintText: currentPlaceholder ?? widget.placeholder ?? null,
                          hintStyle: defaultHintStyle( null, null ),
                          ),
                        ),
                      )
                    : Container( ),
                    widget.fieldType == FieldType.RichText
                    ? RichText(
                      text: currentFieldValue ?? widget.fieldValue,
                      textAlign: TextAlign.start,
                      )
                    : Container( ),
                    widget.fieldType == FieldType.RichTextEdit
                    ?
                    //                  ZefyrScaffold(
                    //                          child: ZefyrEditor(
                    //                            padding: EdgeInsets.all(8),
                    //                            controller: _richTextEditController,
                    //                            focusNode: _richTextEditFocusNode,
                    //                          ),
                    //                        )
                    Container( child: PlatformText( 'RichTextEdit is not yet supprted' ) )
                    : Container( ),
                    widget.fieldType == FieldType.DropDownList
                    ? Container(
                      height: 42.0,
                      //
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular( 5.0 ),
                        border: Border.all( color: widget.fieldBackgroundColor ),
                        color: widget.fieldBackgroundColor,
                        ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder( borderSide: BorderSide(
                                color: Colors.transparent ) ) ),
                        value: currentFieldValue ?? widget.fieldValue,
                        items: widget.listItems ?? [],
                        icon: Image( image: AssetImage( "assets/DropDownIcon.png" ) ),
                        iconSize: 36.0,
                        onChanged: onChangedInternal,
                        style: defaultFieldStyle(
                            widget.fieldTextColor, widget.fieldBackgroundColor ),
                        isExpanded: false,
                        hint: PlatformText( widget.placeholder ?? '' ),
                        disabledHint: PlatformText( widget.validationMessage ?? '' ),
                        ),
                      )
                    : Container( ),
                  ] ),
              ),
          ],
          ),
        ),
      )
  }
}
