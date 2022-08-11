import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/icons/icons_generetor.dart';
import 'package:port_leonir/activy/big_device/icons/start_icon.dart';
import 'package:port_leonir/activy/big_device/start_menu.dart';
import 'package:port_leonir/activy/comp/styles.dart';
import 'package:port_leonir/activy/comp/title.dart';

import 'Functions.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    final wd = MediaQuery.of(context).size.width;
    final hg = MediaQuery.of(context).size.height;
    StyleMain style = StyleMain();
    Functions call = Functions();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: wd,
        height: hg,
        child: Stack(children: [
          //Titulo
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Myname(myName: "Leonir", mySurname: "Júnior"),
                Text("Developer", style: style.infoGeral),
              ],
            ),
          ),

          //icones
          Positioned(
            top: 30,
            left: 40,
            child: Column(
              children: [
                IconGenerator(image: "img/pc_icon.png", iconFunction: (){}, textIcon: "Meu Computador"),
                SizedBox(height: 20,),
                IconGenerator(image: "img/docx_icon.png", iconFunction: (){}, textIcon: "Curriculum"),
                SizedBox(height: 20,),
                IconGenerator(image: "img/skill_icon.png", iconFunction: (){}, textIcon: "Minhas Skills"),
              ],
            ),
          ),

          //menu Start
          call.isClickStart ?  Stack(
            children: [
              GestureDetector(
                onTap: ()=> setState(() {call.startMenu();}),
                child:Container(
                  width: wd,
                  height: hg,
                  color: Colors.transparent,
                ),
              ),
              StartMenu(),
            ],
          ) : Container(),

          //Iniciar Background
          Positioned(
            bottom: 0,
            child: Container(
              width: wd,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF212121),
              ),
            ),
          ),

          //Componentes do iniciar
          Positioned(
            left: 15,
            bottom: 5,
            width: wd,
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:(){
                    setState(() {
                    call.startMenu();
                  });},
                    child: Container(child: StartIcon()),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
