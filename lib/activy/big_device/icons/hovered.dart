import 'package:flutter/material.dart';




class OnHovered extends StatefulWidget {
  final Widget child;
  const OnHovered({Key? key, required this.child}) : super(key: key);
  @override
  State<OnHovered> createState() => _OnHoveredState();
}class _OnHoveredState extends State<OnHovered> {
 bool isHovered = false;
  @override
  Widget build(BuildContext context) {

    final BoxDecoration styleHover = BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      border: Border.all(
        color: Colors.grey.withOpacity(0.3),
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );

    BoxDecoration style  = BoxDecoration(
      border: Border.all(
        color: Colors.transparent,
        width: 1.0,
      ),
    );


    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
        child: isHovered ? Container(
            width: 130,
            height: 80,
            //color: Colors.grey.withOpacity(0.1),
            decoration: styleHover,
            child: widget.child
        ):Container(
            width: 130,
            height: 80,
            decoration:style,
            child: widget.child
        )
    ) ;
  }

  void onEntered(bool isHovered)=> setState(() {this.isHovered = isHovered;});
}
