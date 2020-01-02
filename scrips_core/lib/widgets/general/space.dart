import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  Space({Key key, this.horizontal = 0, this.vertical = 0}) : super(key: key);
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: this.horizontal / 2,
        vertical: this.vertical / 2,
      ),
    );
  }
}
