import 'package:flutter/material.dart';


class MyComputerIcon extends StatelessWidget {
  const MyComputerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Image.asset("img/pc_icon.png", width: 60,),
          Text("Meu Computador", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
