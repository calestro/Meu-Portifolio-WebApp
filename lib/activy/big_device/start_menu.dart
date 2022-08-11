import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/icons/icons_generetor.dart';
import 'package:port_leonir/activy/comp/styles.dart';
import 'package:port_leonir/activy/comp/system_software.dart';

import 'icons/hovered.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({Key? key,}) : super(key: key);

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  @override
  Widget build(BuildContext context) {
  SystemSoftware system = SystemSoftware();
  StyleMain style = StyleMain();




    return Stack(
      children: [
        Positioned(
          left: 15,
          bottom: 10,
          child: Container(
            width: 400,
            height: 600,
            decoration: style.startMenu,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Center(child: Text("Social Media", style:style.infoGeral, textAlign: TextAlign.center,)),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconGenerator(image: "img/git.png", iconFunction: (){}, textIcon: "GitHub",size: 37),
                      IconGenerator(image: "img/git.png", iconFunction: (){}, textIcon: "GitHub",size: 37),
                      IconGenerator(image: "img/git.png", iconFunction: (){}, textIcon: "GitHub",size: 37),
                    ],
                  ),
                ),
                Container(height: 360 - (system.initStart.length * 50)),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: system.initStart.length,
                      itemBuilder: (context, index){
                        bool isIcon = true;
                        if(system.initStart[index]["icon"].runtimeType.toString() != "IconData"){
                          isIcon = false;
                        }

                        if(system.initStart[index].length == 2) {
                          return Column(
                            children: [
                              Container(
                                width: 400,
                                height: 50,
                                alignment: Alignment.centerLeft,
                                color: Colors.black12.withOpacity(0.3),
                                child: Row(
                                  children: [
                                    isIcon ? Icon(system.initStart[index]["icon"] ) : system.initStart[index]["icon"],
                                    Text(system.initStart[index]["title"], textAlign: TextAlign.start,)
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        else{
                          return Container(
                            width: 400,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            color: Colors.black12.withOpacity(0.3),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(system.initStart[index]["icon"]),
                                Text(system.initStart[index]["title"], textAlign: TextAlign.start,),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                      child: Icon(Icons.arrow_forward)
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                  ),
                ),
              ],
            ),
          ),
        ),

        //botão de desligar
        Positioned(
          bottom: 72,
          left: 320,
          child: OnHovered(
            type: "icon",
            size: 10,
            child: Container(
              child: Image.asset("img/power.png"),
            ),
          ),
        ),

      ],
    );
  }
}
