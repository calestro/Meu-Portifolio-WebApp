import 'package:flutter/material.dart';
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
      body: Container(
        width: wd,
        height: hg,
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Stack(
              children: [

            //Titulo
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Myname(myName: "Leonir", mySurname: "Júnior"),
                Text("Developer", style: style.infoGeral),
              ],
            ),

            //contact
            Positioned(
              top: 80,
              left: wd * 0.5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("(22) 992131045  ", style: style.infoGeral,),
                  Text("calestrojunior@gmail.com  ",style: style.infoGeral),
                  Text("Rua São Paulo N° 256  ",style: style.infoGeral),
                ],
              ),
            ),

            Row(
              children: [],
            ),
          ]),
        ),
      ),
    );
  }
}
