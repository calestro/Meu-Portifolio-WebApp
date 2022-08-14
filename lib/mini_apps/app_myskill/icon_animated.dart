import 'package:flutter/material.dart';
import 'package:port_leonir/mini_apps/app_myskill/skill_app_data.dart';


class IconWidget extends ImplicitlyAnimatedWidget {
  final Color color;
  final bool isSelected;
  final int index;

  const IconWidget({
    required this.color,
    required this.isSelected,
    required this.index,
  }) : super(duration: const Duration(milliseconds: 300));

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      IconWidgetState();
}

class IconWidgetState extends AnimatedWidgetBaseState<IconWidget> {
  Tween<double>? _scaleTween;
  @override
  Widget build(BuildContext context) {
    final scale = 1 + _scaleTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.translationValues(scale, 0, 0).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Icon(
        AppData.dataList[widget.index].iconInit,
        color: widget.isSelected ? Colors.green : widget.color,
        size: 28,
      ),
    );
  }


  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _scaleTween = visitor(
      _scaleTween,
      widget.isSelected ? 1.0 : 0.0,
          (dynamic value) => Tween<double>(
        begin: value,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>;
  }
}



