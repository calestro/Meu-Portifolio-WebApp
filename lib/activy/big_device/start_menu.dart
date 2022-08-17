// ignore_for_file: prefer_interpolation_to_compose_strings, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:port_leonir/activy/comp/styles.dart';
import 'package:port_leonir/activy/comp/system_software.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/my_icon_icons.dart';
import 'icons/hovered.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {

  final Uri urlGit = Uri.parse("https://github.com/calestro");
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
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  "Social Media",
                  style: style.infoGeral,
                  textAlign: TextAlign.center,
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OnHovered(
                            type: 'icon',
                            size: 32,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(MyIcon.linkedin_circled,
                                    size: 32))),
                        OnHovered(
                            type: 'icon',
                            size: 32,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  MyIcon.whatsapp,
                                  size: 32,
                                ))),
                        OnHovered(
                            type: 'icon',
                            size: 32,
                            child: IconButton(
                                onPressed: _launchGit,
                                icon: const Icon(
                                  MyIcon.github,
                                  size: 32,
                                ))),
                      ],
                    ),
                  ),
                ),
                Container(height: 360 - (system.initStart.length * 50)),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: system.initStart.length,
                      itemBuilder: (context, index) {
                        if (system.initStart[index].length == 2) {
                          return Column(
                            children: [
                              Container(
                                width: 400,
                                height: 50,
                                alignment: Alignment.centerLeft,
                                color: Colors.black12.withOpacity(0.3),
                                child: OnHovered(
                                  type: "icon",
                                  size: 400,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        // ignore: prefer_interpolation_to_compose_strings
                                        Icon(
                                          system.initStart[index]["icon"],
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "     " +
                                              system.initStart[index]["title"],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container(
                            width: 400,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            color: Colors.black12.withOpacity(0.3),
                            child: OnHovered(
                              type: "icon",
                              size: 400,
                              child: GestureDetector(
                                onTap: OptionsMenu,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(system.initStart[index]["icon"]),
                                    Text(
                                      system.initStart[index]["title"],
                                      textAlign: TextAlign.start,
                                    ),
                                    const Expanded(
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(Icons.arrow_forward)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),


      ],
    );
  }

// ignore: non_constant_identifier_names
  void OptionsMenu() {}

  Future<void> _launchGit() async {
    if (!await launchUrl(urlGit)) {
      throw 'Could not launch $urlGit';}
    }
}
