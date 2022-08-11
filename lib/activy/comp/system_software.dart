import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/icons/icons_generetor.dart';


class SystemSoftware{

  Map <dynamic,dynamic> games = {
    "title":"Games",
    "icon":Icons.gamepad,
    1 : "bus",
  };

  Map <dynamic,dynamic> software = {
    "title":"Programs",
    "icon":Icons.account_tree,
    1 : "Snake",
  };


  late List<dynamic> initStart = [
    games,
    software,
    software,
    software,
    software,
    software,

  ];

}