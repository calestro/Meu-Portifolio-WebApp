import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/icons/icons_generetor.dart';
import 'package:port_leonir/activy/big_device/icons/start_icon.dart';
import 'package:port_leonir/activy/big_device/start_menu.dart';
import 'package:port_leonir/activy/big_device/windows_maker/list_widget.dart';
import 'package:port_leonir/activy/big_device/windows_maker/mdi_controller.dart';
import 'package:port_leonir/activy/big_device/windows_maker/mdi_manager.dart';
import 'package:port_leonir/activy/comp/date_and_time.dart';
import 'package:port_leonir/activy/comp/styles.dart';
import 'package:port_leonir/activy/comp/title.dart';
import 'package:port_leonir/mini_apps/app_myskill/my_skills.dart';
import 'package:port_leonir/mini_apps/app_readme/readme_main.dart';
import '../../mini_apps/curriculum/my_curriculum.dart';
import 'functions.dart';

class MainBigDevices extends StatefulWidget {

  const MainBigDevices({Key? key,}) : super(key: key);

  @override
  State<MainBigDevices> createState() => _MainBigDevicesState();
}

class _MainBigDevicesState extends State<MainBigDevices> {
  late MdiController mdiController;
  bool isInit = false;
@override
  void initState() {
  mdiController = MdiController(() {setState(() {});},context);
  super.initState();
  }
  ListWidget list = ListWidget();
  late final wd;
  late final hg;
  @override
  Widget build(BuildContext context) {
    if(!isInit){ init();isInit = true; }
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
                IconGenerator(image: "img/pc_icon.png",
                    iconFunction: (){mdiController.addApp("Meu Computador", const ReadmeApp());},
                    textIcon: "Meu Computador"),
                const SizedBox(height: 20,),
                IconGenerator(image: "img/skill_icon.png",
                    iconFunction:(){mdiController.addApp("Minhas Skills", const GraphMySkill());},
                    textIcon: "Minhas Skills"
                ),
              ],
            ),
          ),

          //Area para as Janelas
          Positioned(
            top:0,
            left: 0,
            child: SizedBox(
              width: wd,
              height: hg,
              child: MdiManager(mdiController: mdiController,),
            ),
          ),

          //StarOpen
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
              const StartMenu(),
            ],
          ) : Container(),

          //Start Background
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

          //exit menuStart
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
                    child: const StartIcon(),
                ),
              ],
            ),
          ),

          //Icon Start Menu
          Positioned(
            left: 140,
            bottom:0,
              child:  SizedBox(
                width: wd * 0.699,
                height: 54,
                child: Center(
                  child: ListView.builder(
                      itemCount:list.windowsOpenned.length ,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var imgGenerator = list.IconAplication[list.windowsOpenned[index].title];
                        return GestureDetector(
                          onTap: () {

                            if(!list.windowsOpenned[index].isMinimmize) {
                              list.savePostion = {list.windowsOpenned[index].key : list.windowsOpenned[index].x};
                              list.windowsOpenned[index].x = wd + 200;
                              mdiController.onUpdate();
                            }
                            else{
                              double? x = list.savePostion[list.windowsOpenned[index].key];
                              if(x == null || x >= wd){x= 30;}
                              list.windowsOpenned[index].x = x;
                              mdiController.onUpdate();
                            }
                            list.windowsOpenned[index].isMinimmize = !list.windowsOpenned[index].isMinimmize;
                              },

                          child:IconGenerator(image: imgGenerator!, iconFunction: (){}, textIcon:"", size: 50,),
                        );
                      }
                  ),
                ),
              ),),

          //Hora
          const DateAndTime(),



        ]),
      ),
    );
  }
  void init(){
    mdiController.addApp("Meu Computador", const ReadmeApp());
  }
  void initMaxize(){
    list.windowsOpenned.last.currentWidth = wd;
    list.windowsOpenned.last.currentHeight = hg;
    list.windowsOpenned.last.x= 0;
    list.windowsOpenned.last.y= 0;
    mdiController.onUpdate;
    setState(() {});
  }
}
