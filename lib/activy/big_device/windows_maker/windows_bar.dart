import 'package:flutter/material.dart';


class JanelaPopUp{

  WindowsBar(context,child){
    OverlayEntry? entry;
    double wd =MediaQuery.of(context).size.width;
    double hg =MediaQuery.of(context).size.height;


    entry = OverlayEntry(
        builder: (context) {
              return Teste(child: child, entry:entry);

            });
    final flutuante = Overlay.of(context)!;
    flutuante.insert(entry);

}
}

class Teste extends StatefulWidget {
  final Widget child;
  final OverlayEntry? entry;
  const Teste({Key? key, required this.child, required this.entry}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  double wd = 0;
  double hg = 0;
  bool isMaximize = false;
  bool isMinimize = false;
  double currentlocationX = 0;
  double currentlocationY = 0;
  @override
  Widget build(BuildContext context) {
      if(wd == 0 && hg == 0) {
        wd = MediaQuery
            .of(context)
            .size
            .width;
        hg = MediaQuery
            .of(context)
            .size
            .height;
      }

    return Stack(
      children: [
        Positioned(
          top:currentlocationX,
          left: currentlocationY,
          child: Container(
            width: wd / 2 + 2,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: isMaximize ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: wd / 2 + 2,
                    decoration: BoxDecoration(
                      color: Color(0xFF212121),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:Radius.circular(10) ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.crop_square, color: Colors.white,),
                          label: Text(""),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              textStyle:
                              TextStyle(fontSize: 0,
                                  fontWeight: FontWeight.bold)),
                          onPressed: (){}
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.close, color: Colors.white,),
                          label: Text(""),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              textStyle:
                              TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          onPressed: (){widget.entry!.remove(); widget.entry == null;
                             },
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: wd / 2,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: widget.child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onHorizontalDragLeft(DragUpdateDetails details) {

  }
}





