import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/windows_maker/resizable_window.dart';

class ListWidget{
  static final ListWidget _listWidget = ListWidget._internal();
  factory ListWidget (){
    return _listWidget;
  }
  ListWidget._internal();

  List<ResizableWindow> windowsOpenned = [];
  bool isMinimmize = false;
  Map<Key?,double> savePostion = {};
  // ignore: non_constant_identifier_names
  Map<String, String> IconAplication = {
    "Minhas Skills":"img/skill_icon.png",
    "Meu Computador":"img/pc_icon.png"


  };
}