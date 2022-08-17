

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/desktop.dart';
import 'package:port_leonir/activy/comp/styles.dart';



class MainConfigure extends StatefulWidget {
  const MainConfigure({Key? key}) : super(key: key);

  @override
  State<MainConfigure> createState() => _MainConfigureState();
}

class _MainConfigureState extends State<MainConfigure> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_,constraints){
          if(constraints.maxWidth >= 480) {
            return const MainBigDevices();
          }
          else{
            return Material(
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Desculpe-me", style:StyleMain().infoGeral,),
                      Text("Versão Mobile em Manutenção", style:StyleMain().infoGeral)
                    ],
                  ),
                ),
              ),
            );
          }

        }
    );
  }
}
