import 'package:flutter/material.dart';

class DataGenerator extends StatelessWidget {
  final String textStudy;
  final String textdescription;
  final IconData iconTitle;
  const DataGenerator(
      {Key? key, required this.textStudy, required this.textdescription, required this.iconTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(iconTitle),
            Text(textStudy),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 45),
          child: Text(textdescription),
        )
      ],
    );
  }
}
