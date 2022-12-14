import 'package:flutter/material.dart';



class Myname extends StatelessWidget {
  const Myname ({Key? key, required this.myName, required this.mySurname}) : super(key: key);
  final String myName;
  final String mySurname;

  @override
  Widget build(BuildContext context) {

    const  TextStyle name = TextStyle(color: Color(0xFF549a82), fontSize: 75);
    const  TextStyle surname = TextStyle(color: Color(0xFF70bcc9), fontSize: 75);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(myName, style: name),
        Text(mySurname, style:surname),
      ],
    );
  }
}
