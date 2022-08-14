import 'package:flutter/material.dart';

import '../../config/languages_icon_icons.dart';
import 'helper/bar_data_helper.dart';



class AppData{
  static const dataList = [
    BarDataHelper(Color(0xFFecb206), 20, LanguagesIcon.python,"Python",
        "python"
    ),
    BarDataHelper(Color(0xFFa8bd1a), 17, LanguagesIcon.php ,"PHP X LARAVEL",
    "Tenhos conhecimentos na Linguagem"
    ),
    BarDataHelper(Color(0xFF17987b), 10,LanguagesIcon.node_js, "Node",
    "Tenhos conhecimentos na Linguagem"
    ),
    BarDataHelper(Color(0xFFb87d46), 20.5,LanguagesIcon.vuejs, "JavaScript: VueJs",
        "Tenhos conhecimentos na Linguagem"
    ),
    BarDataHelper(Color(0xFF295ab5), 20,LanguagesIcon.vue_color,"2","2"),
    BarDataHelper(Color(0xFFea0107), 49,LanguagesIcon.vue_no_color,"3","2"),
  ];
}