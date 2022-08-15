import 'package:flutter/material.dart';



class OnHovered extends StatefulWidget {

  final Widget child;
  final String type;
  final size;


  OnHovered({Key? key, required this.child, required this.type, this.size = 60 }) : super(key: key);
  @override
  State<OnHovered> createState() => _OnHoveredState();
}
class _OnHoveredState extends State<OnHovered> {

  bool isHovered = false;
  List<Color> colorHovered = [Colors.grey.withOpacity(0.1), Colors.grey.withOpacity(0.3)];
  Color color = Colors.transparent;



 @override
  Widget build(BuildContext context) {

   final BoxDecoration styleHover = BoxDecoration(
     color:isHovered ? colorHovered[0] : color ,
     border: Border.all(
       color: isHovered ? colorHovered[1] : color,
       width: 1.0,
     ),
     borderRadius: const BorderRadius.all(
       Radius.circular(15),
     ),
   );


    switch(widget.type) {
      case "icon":


        return MouseRegion(

        onEnter: (event) => onEntered(true),
        onExit: (event) => onEntered(false),

        child: Container(
            width: widget.size + 70,
            height: widget.size + 30,
            decoration: styleHover,
            child: widget.child
        )
    );

      case "start":

         final BoxDecoration startBoxHover = BoxDecoration(
          color: isHovered ? Colors.black12.withOpacity(0.2) : Colors.transparent,
          border: Border.all(
            color:isHovered ? Colors.black12.withOpacity(0.3) : Colors.transparent,
            width: 5.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        );

         return MouseRegion(
          onEnter: (event) => onEntered(true),
          onExit: (event) => onEntered(false),
          child: Container(
            height: 40,
            width: 115,
            decoration: startBoxHover,
              ),
        );

         default:
        return Container();
 }
  }

  void onEntered(isHovered)=> setState(() {this.isHovered = isHovered;});
}
