import 'package:flutter/material.dart';
import 'package:port_leonir/mini_apps/curriculum/data_generator.dart';

import 'arrow_container_painter.dart';



class MyCurriculum extends StatefulWidget {
  const MyCurriculum({Key? key}) : super(key: key);

  @override
  State<MyCurriculum> createState() => _MyCurriculumState();
}

class _MyCurriculumState extends State<MyCurriculum> {
  @override
  Widget build(BuildContext context) {
    double wd = MediaQuery.of(context).size.width;
    double hg = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white60,
      child: Stack(
        children: [
          Positioned(
              top: 10,
              left: 10,
              child: Text("Leonir Júnior", style: TextStyle(fontSize: 50),)),
          Positioned(
            top: 60,
              left: 60,
              child: Text("Ribeiro Calestro", style: TextStyle(fontSize: 50),)),
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              child: Image.asset("img/git.png"),
            ),
          ),
          Positioned(
            top: 130,
            left: wd/3 * 2- 20,
            child: CustomPaint(
              painter: arrowContainer(true),
              child: Container(
                width: wd/3 +10,
                height: 30,
                child: Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Experiência", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 130,
            left: wd/3 - 10,
            child: CustomPaint(
              painter: arrowContainer(false),
              child: Container(
                width: wd/3,
                height: 30,
                child: Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Educação", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            child: CustomPaint(
              painter: arrowContainer(true),
              child: Container(
                width: wd/3,
                height: 30,
                child: Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Introdução", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 185,
              child: SizedBox(
                width: wd,
                height: hg -285,
                child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding: EdgeInsets.only(left: 60,right: 60),
                      child: Column(
                        children: [
                          Text("Olá, meu nome e Leonir Junior, e atualmente trabalho como autonomo em desenvolvimento de "
                              "WebApps e Mobile, também tenho um emprego na CLT no ramo de refrigeração na qual uso para "
                              "completar meus rendimentos.Tenho expêriencia de 3 anos em Desenvolvimento Web inclusive "
                              "já lecionei em Cursos profissionalizantes de Web Design.Tenho prefêrencia em trabalho no Back-end, mas também exerço"
                              " a função no Front-end usando as Frameworks mais conhecidas do mercado.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ],
                      ),
                    )),
                    Expanded(child: Padding(
                      padding: EdgeInsets.only(left:60,right: 60),
                      child: Column(
                        children: [
                          DataGenerator(textStudy: "teste", textdescription:"teste", iconTitle: Icons.book,),
                          DataGenerator(textStudy: "teste", textdescription:"teste", iconTitle: Icons.book,),
                          DataGenerator(textStudy: "teste", textdescription:"teste", iconTitle: Icons.book,),
                          DataGenerator(textStudy: "teste", textdescription:"teste", iconTitle: Icons.book,),
                        ],
                      ),
                    )),
                    Expanded(
                        child:Padding(
                          padding: EdgeInsets.only(left: 60, right: 60),
                          child: Column(
                            children: [
                              DataGenerator(textStudy: "teste", textdescription:"teste", iconTitle: Icons.work,),
                              DataGenerator(textStudy: "teste", textdescription:"teste", iconTitle: Icons.work,),
                              DataGenerator(textStudy: "teste", textdescription:"teste", iconTitle: Icons.work,),
                              DataGenerator(textStudy: "teste", textdescription:"teste", iconTitle: Icons.work,),
                            ],
                          ),
                        )
                    ),
                  ],
                )
              )
          ),


        ],
      ),
    );
  }
}
