// ignore_for_file: must_be_immutable



import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/windows_maker/list_widget.dart';

class ResizableWindow extends StatefulWidget {
  late double currentHeight, defaultHeight = 400;
  late double currentWidth, defaultWidth = 600;
  late double x;
  late double y;
  String title;
  Widget body;
  bool isMinimmize  = false;
  bool isMaximize = false;
  var context;

  late Function(double, double) onWindowDragged;
  late VoidCallback onCloseButtonClicked;



  ResizableWindow(this.title,this.body,this.isMaximize,this.context) : super(key: UniqueKey()) {
    currentHeight = isMaximize ? MediaQuery.of(context).size.height - 60 :defaultHeight;
    currentWidth =  isMaximize ?  MediaQuery.of(context).size.width :defaultWidth;
  }

  @override
  State<ResizableWindow> createState() =>_ResizableWindowState();
}

class _ResizableWindowState extends State<ResizableWindow> {
  final _headerSize = 50.0;
  final _borderRadius = 10.0;
  final BoxDecoration _boxDecoration =  const BoxDecoration(
    color: Color(0xFF212121),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:Radius.circular(10) ),
  );
  ListWidget list = ListWidget();
  late double wd;
  late double hg;
  @override
  Widget build(BuildContext context) {
   wd = MediaQuery.of(context).size.width;
   hg = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
          //Here goes the same radius, u can put into a var or function
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x54000000),
              spreadRadius: 4,
              blurRadius: 5,
            ),
          ],
        ),
      child: ClipRRect(
        borderRadius:  BorderRadius.all(Radius.circular(_borderRadius)),
        child: Stack(
          children: [
            Column(
              children: [_getHeader(), _getBody()],
            ),
            Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onHorizontalDragUpdate: _onHorizontalDragRight,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeLeftRight,
                    opaque: true,
                    child: Container(
                      width: 4,
                    ),
                  ),
                )),
            Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onHorizontalDragUpdate: _onHorizontalDragLeft,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeLeftRight,
                    opaque: true,
                    child: Container(
                      width: 4,
                    ),
                  ),
                )),
            Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: GestureDetector(
                  onVerticalDragUpdate: _onHorizontalDragTop,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeUpDown,
                    opaque: true,
                    child: Container(
                      height: 4,
                    ),
                  ),
                )),
            Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onVerticalDragUpdate: _onHorizontalDragBottom,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeUpDown,
                    opaque: true,
                    child: Container(
                      height: 4,
                    ),
                  ),
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onPanUpdate: _onHorizontalDragBottomRight,
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.resizeUpLeftDownRight,
                    opaque: true,
                    child: SizedBox(
                      height: 6,
                      width: 6,
                    ),
                  ),
                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: GestureDetector(
                  onPanUpdate: _onHorizontalDragBottomLeft,
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.resizeUpRightDownLeft,
                    opaque: true,
                    child: SizedBox(
                      height: 6,
                      width: 6,
                    ),
                  ),
                )),
            Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onPanUpdate: _onHorizontalDragTopRight,
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.resizeUpRightDownLeft,
                    opaque: true,
                    child: SizedBox(
                      height: 6,
                      width: 6,
                    ),
                  ),
                )),
            Positioned(
                left: 0,
                top: 0,
                child: GestureDetector(
                  onPanUpdate: _onHorizontalDragTopLeft,
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.resizeUpLeftDownRight,
                    opaque: true,
                    child: SizedBox(
                      height: 6,
                      width: 6,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _getHeader() {
    return GestureDetector(
      onPanUpdate: (tapInfo) {
        widget.onWindowDragged(tapInfo.delta.dx, tapInfo.delta.dy);
      },
      child: Container(
        width: widget.currentWidth ,
        height: _headerSize,
        decoration: _boxDecoration,
        child: Stack(

          children: [
            Positioned(
              right: 108,
              top: 0,
              bottom: 0,
              child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    textStyle:
                    const TextStyle(fontSize: 0,
                        fontWeight: FontWeight.bold)),
                onPressed:onClickMinimize,
               child: const Text("-"),
              ),
            ),
            Positioned(
              right: 50,
              top: 0,
              bottom: 0,
                child: ElevatedButton.icon(
                    icon: const Icon(Icons.crop_square, color: Colors.white,),
                    label: const Text(""),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        textStyle:
                        const TextStyle(fontSize: 0,
                            fontWeight: FontWeight.bold)),
                    onPressed:_onClickMaximize,
                ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.close, color: Colors.white,),
                label: const Text(""),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle:
                    const TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold)),
                onPressed:widget.onCloseButtonClicked,
              ),
            ),
            Positioned.fill(child: Center(child: Text(widget.title,style: const TextStyle(color: Colors.white),))),
          ],
        ),
      ),
    );
  }

  _getBody() {
    return Container(
      width: widget.currentWidth,
      height: widget.currentHeight - _headerSize,
      color: Colors.blueGrey,
      child: widget.body,
    );
  }


  void _onHorizontalDragLeft(DragUpdateDetails details) {


    setState(() {
      widget.currentWidth -= details.delta.dx;
      if (widget.currentWidth < widget.defaultWidth) {
        widget.currentWidth = widget.defaultWidth;
      } else {
        widget.onWindowDragged(details.delta.dx, 0);
      }
    });
  }

  void _onHorizontalDragRight(DragUpdateDetails details) {
    setState(() {
      widget.currentWidth += details.delta.dx;
      if (widget.currentWidth < widget.defaultWidth) {
        widget.currentWidth = widget.defaultWidth;
      }
    });
  }

  void _onHorizontalDragBottom(DragUpdateDetails details) {

    setState(() {
      widget.currentHeight += details.delta.dy;
      if (widget.currentHeight < widget.defaultHeight) {
        widget.currentHeight = widget.defaultHeight;
      }
    });
  }

  void _onHorizontalDragTop(DragUpdateDetails details) {

    setState(() {
      widget.currentHeight -= details.delta.dy;
      if (widget.currentHeight < widget.defaultHeight) {
        widget.currentHeight = widget.defaultHeight;
      } else {
        widget.onWindowDragged(0, details.delta.dy);
      }
    });
  }

  void _onHorizontalDragBottomRight(DragUpdateDetails details) {
    _onHorizontalDragRight(details);
    _onHorizontalDragBottom(details);
  }

  void _onHorizontalDragBottomLeft(DragUpdateDetails details) {
    _onHorizontalDragLeft(details);
    _onHorizontalDragBottom(details);
  }

  void _onHorizontalDragTopRight(DragUpdateDetails details) {
    _onHorizontalDragRight(details);
    _onHorizontalDragTop(details);
  }

  void _onHorizontalDragTopLeft(DragUpdateDetails details) {
    _onHorizontalDragLeft(details);
    _onHorizontalDragTop(details);
  }

  void _onClickMaximize() {
    setState(() {
      if(!widget.isMaximize) {
        widget.currentWidth = MediaQuery
            .of(context)
            .size
            .width;
        widget.currentHeight = MediaQuery
            .of(context)
            .size
            .height - 60;
        widget.x = 0;
        widget.y = 0;
        _onHorizontalDragLeft(DragUpdateDetails(globalPosition: Offset.zero));
      }
      else{
        widget.currentWidth = widget.defaultWidth;
        widget.currentHeight = widget.defaultHeight;
        widget.x = wd * 0.3 ;
        widget.y = hg * 0.3;
        _onHorizontalDragLeft(DragUpdateDetails(globalPosition: Offset.zero));
      }
      widget.isMaximize = !widget.isMaximize;
    });
  }
    void onClickMinimize(){
    setState(() {

      int index =  list.windowsOpenned.indexWhere((element) => element.key == widget.key);
      list.savePostion = {list.windowsOpenned[index].key:list.windowsOpenned[index].x};
      list.windowsOpenned[index].x = wd + 200;
      list.windowsOpenned[index].isMinimmize = true;

      _onHorizontalDragLeft(DragUpdateDetails(globalPosition: Offset.infinite));

    });
    }


}
