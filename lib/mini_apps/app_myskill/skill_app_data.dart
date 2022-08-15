import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/my_icon_icons.dart';
import 'helper/bar_data_helper.dart';



class AppData{
  static const dataList = [
    BarDataHelper(Color(0xFFecb206), 65, MyIcon.python,"Python",
            "Tenho uma longo conhecimento no Python, geralmente tenho preferência"
            "em usa-lo nos meus Projetos de Iot, no momento estou apredendo usar"
            "Atualmente estou estudando a biblioteca Django para ter uma gama maior "
                "de ferramentas para desenvolver Back-end"
    ),
    BarDataHelper(Color(0xFFa8bd1a), 70, MyIcon.php ,"PHP X LARAVEL",
    ""
    ),
    BarDataHelper(Color(0xFF17987b), 72,MyIcon.node_js, "NodeJS",
    ""
    ),
    BarDataHelper(Color(0xFFb87d46), 55,MyIcon.vuejs, "JavaScript: VueJs",
        ""
    ),
    BarDataHelper(Color(0xFFad4641),87,MyIcon.flutter_svgrepo_com,"Flutter",""),
    BarDataHelper(Color(0xFFea0107),65,MyIcon.laravel,"Laravel",""),
  ];
}