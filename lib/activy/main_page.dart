import 'package:flutter/material.dart';
import 'package:port_leonir/activy/comp/icons/mycomputer.dart';
import 'package:port_leonir/activy/comp/main_page_style.dart';
import 'package:port_leonir/activy/comp/title.dart';

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

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: wd,
        height: hg,
        child: Stack(children: [
          //Titulo
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Myname(myName: "Leonir", mySurname: "Júnior"),
                Text("Developer", style: style.infoGeral),
              ],
            ),
          ),

          //contact
          Positioned(
            top: 45,
            right: 30,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "(22) 992131045  ", style: style.infoGeral,
                ),
                Text("calestrojunior@gmail.com  ", style: style.infoGeral),
                Text("Nova Friburgo  ", style: style.infoGeral),
              ],
            ),
          ),

          //icones
          Positioned(
            top: 130,
            left: 40,
            child: Column(
              children: [
                MyComputerIcon(image: "img/pc_icon.png", iconFunction: (){}, textIcon: "Meu Computador"),
                SizedBox(height: 20,),
                MyComputerIcon(image: "img/docx_icon.png", iconFunction: (){}, textIcon: "Curriculum"),
              ],
            ),
          ),

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
                Container(
                  height: 40,
                  width: 115,
                  decoration: style.startBox,
                  child: Center(
                      child: Text(
                    "START",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
