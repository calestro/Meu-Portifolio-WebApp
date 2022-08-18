import 'package:flutter/material.dart';

class DataGenerator extends StatelessWidget {
  final String textStudy;
  final String textdescription;
  final String instituicaoText;
  final IconData iconTitle;

  const DataGenerator(
      {Key? key, required this.textStudy, required this.textdescription, required this.iconTitle, required this.instituicaoText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text(instituicaoText)),
          Row(
            children: [
              Icon(iconTitle),
              Text(textStudy, textAlign: TextAlign.center,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Text(textdescription),
          )
        ],
      ),
    );
  }
}
