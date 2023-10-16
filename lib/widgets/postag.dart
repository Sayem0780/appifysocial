import 'package:flutter/material.dart';

import '../config/palette.dart';

class PostTag extends StatelessWidget {
  PostTag({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 110,
          decoration: BoxDecoration(
              color: Palette.facebookSharpBlue,
              borderRadius: BorderRadius.circular(7)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: Palette.facebookBlue,
                size: 20.0,
                weight: 60.0,
              ),
              Text(title,style: TextStyle(fontSize: 15,color: Palette.facebookBlue,fontWeight: FontWeight.bold),),
              Icon(
                Icons.arrow_drop_down_sharp,
                color: Palette.facebookBlue,
                size: 20.0,
                weight: 60.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}