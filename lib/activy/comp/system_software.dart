import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/icons/icons_generetor.dart';
import 'package:port_leonir/config/my_icon_icons.dart';


class SystemSoftware{

  Map <dynamic,dynamic> games = {
    "title":"Cadastrador de Placas",
    "icon":Icons.newspaper_rounded,
  };

  Map <dynamic,dynamic> software = {
    "title":"Snake Game",
    "icon":MyIcon.snake,
  };


  late List<dynamic> initStart = [
    games,
    software,
  ];

}