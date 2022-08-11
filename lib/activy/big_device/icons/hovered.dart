import 'package:flutter/material.dart';


class OnHovered extends StatefulWidget {

  final Widget child;

  const OnHovered({Key? key, required this.child}) : super(key: key);
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
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );

    return MouseRegion(

        onEnter: (event) => onEntered(true),
        onExit: (event) => onEntered(false),

        child:Container(
            width: 130,
            height: 80,
            decoration: styleHover,
            child: widget.child
        )
    );
  }

  void onEntered(bool isHovered)=> setState(() {this.isHovered = isHovered;});
}
