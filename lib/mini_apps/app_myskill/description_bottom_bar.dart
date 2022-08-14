import 'package:flutter/material.dart';
import 'package:port_leonir/mini_apps/app_myskill/skill_app_data.dart';



class DescriptionLanguage extends StatelessWidget {
  final int index;
  const DescriptionLanguage({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double hg = MediaQuery.of(context).size.height;
    double wd = MediaQuery.of(context).size.width;

    return Material(
      child: index == -1 ? Center(
      child: Padding(
        padding: EdgeInsets.only(top:30),
        child: Text("Passe o mouse em cima para obter mais informções"),
          ),
        )
      : Container(
        width: wd,
        height: hg * 0.2,
        color: AppData.dataList[index].color,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Text(AppData.dataList[index].title),
                    SizedBox(height: hg * 0.02),
                    Text(AppData.dataList[index].description),
                  ],
                ),
            ),
            Expanded(
              flex: 1,
                child:Icon(AppData.dataList[index].iconInit, size:hg * 0.2,)
            ),
          ],
        ),
      ),
    );
  }
}
