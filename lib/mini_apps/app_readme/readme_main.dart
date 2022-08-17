import 'package:flutter/material.dart';
import 'package:port_leonir/config/my_icon_icons.dart';




class ReadmeApp extends StatefulWidget {
  const ReadmeApp({Key? key}) : super(key: key);

  @override
  State<ReadmeApp> createState() => _ReadmeAppState();
}

class _ReadmeAppState extends State<ReadmeApp> {

  TextStyle title = TextStyle(color: Colors.white, fontSize: 50);
  TextStyle subtitle = TextStyle(color: Colors.white, fontSize: 20);



  @override
  Widget build(BuildContext context) {
    double wd = MediaQuery.of(context).size.width;
    TextStyle title = TextStyle(color: Colors.white, fontSize: 50);
    TextStyle subtitle = TextStyle(color: Colors.white, fontSize: 18);
    TextStyle name = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,);

    return Center(
      child: Container(
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bem Vindo !", style: title),
            SizedBox(height: 15,),
            Text("Clicando no menu Start você poderá desfrutar das minhas aplicações", style: subtitle,),
            Text("elas são carregadas através de uma API Node, de todos os meus repositórios públicos do GitHub", style: subtitle,textAlign: TextAlign.center,),

            SizedBox(height: 50,),
            Text("Leonir Junior", style: subtitle,),
            Text("WebApps & MobileApps", style: subtitle),
            SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(MyIcon.whatsapp, color: Colors.white,),
                SizedBox(width: 5,),
                Text("(22) 992131045", style: subtitle)
              ],
            ),


          ],
        ),
      ),
    );
  }
}
