import 'package:flutter/material.dart';

class ScripsIcons {
  ScripsIcons._privateConstructor();

  static final ScripsIcons _instance = ScripsIcons._privateConstructor();

  static ScripsIcons get instance {
    return _instance;
  }

  static int cancel = 0xe902;
  static int noShow = 0xe918;
  static int waitingRoom = 0xe919;
  static int walkin = 0xe91a;
  static int cancelled = 0xe91b;
  static int forwardArrow = 0xe900;
  static int block = 0xe901;
  static int checkboxEmpty = 0xe904;
  static int checkboxFilled = 0xe903;
  static int comment = 0xe906;
  static int delete = 0xe907;
  static int edit = 0xe908;
  static int externalSource = 0xe909;
  static int home = 0xe90a;
  static int list = 0xe90b;
  static int location = 0xe90c;
  static int minus = 0xe90d;
  static int office = 0xe90e;
  static int flag = 0xe90f;
  static int plus = 0xe910;
  static int recurring = 0xe911;
  static int reminder = 0xe912;
  static int resend = 0xe913;
  static int grid = 0xe914;
  static int vacation = 0xe915;
  static int virtual = 0xe916;
  static int work = 0xe917;

  Icon icon(int data, {double size, Color color}) {
    return Icon(
      IconData(data, fontFamily: "Scrips"),
      color: color,
      size: size,
    );
  }
}
