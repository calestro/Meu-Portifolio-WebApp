import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/desktop.dart';
import 'package:port_leonir/activy/big_device/windows_maker/list_widget.dart';
import 'package:port_leonir/activy/big_device/windows_maker/mdiManager.dart';

import 'activy/big_device/windows_maker/mdiController.dart';
import 'activy/big_device/windows_maker/resizableWindow.dart';

class StartMenuRow extends StatefulWidget {
  const StartMenuRow({Key? key}) : super(key: key);

  @override
  State<StartMenuRow> createState() => _StartMenuRowState();
}

class _StartMenuRowState extends State<StartMenuRow> {

  @override
  void initState() {

    super.initState();
  }

  @override
  ListWidget list = ListWidget();
  Widget build(BuildContext context) {
    MdiController mdiController = MdiController((){setState(() {});},context);



    return Stack(
      children: [
        ListView.builder(
          itemCount:list.windowsOpenned.length ,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                list.windowsOpenned[index].x = 0;
                mdiController.onUpdate();
              },

              child: Column(
                children: [
                  Text(list.windowsOpenned[index].title),

                ],
              ),
            );
          }
        ),
      ],
    );
  }
}
