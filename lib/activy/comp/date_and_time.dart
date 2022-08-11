import 'dart:async';

import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/icons/hovered.dart';
import 'package:port_leonir/activy/comp/styles.dart';


class DateAndTime extends StatefulWidget {
  const DateAndTime({Key? key}) : super(key: key);

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 60), (Timer t) { setState(() {});});
    super.initState();
  }
  Widget build(BuildContext context) {
    
    StyleMain style = StyleMain();
    
    var hora = DateTime.now().toLocal().toIso8601String();
    return Stack(
      children: [
        Positioned(
          bottom: 32,
          right: 52,
          child: Container(
            child: Text(hora.substring(11,16), style: style.infoGeral,),
          ),
        ),
        //data
        Positioned(
          bottom: 10,
          right: 30,
          child: Container(
            child: Text(hora.substring(8,10)+ "/" + hora.substring(5,7)+ "/" + hora.substring(0,4), style: style.infoGeral,),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 28,
          child: OnHovered(
            type: "icon",
            size: 30,
            child: Container(),
          ),
        ),

      ],
    );
  }
}
