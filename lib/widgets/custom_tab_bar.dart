import 'package:flutter/material.dart';
import 'package:appifysocial/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      tabs: icons
          .asMap()
          .map(
              //i = index, e = icon
              (i, e) => MapEntry(
                    i,
                    Tab(
                      icon: Icon(
                        e,
                        color: i == selectedIndex
                            ? Palette.facebookBlue
                            : Colors.black45,
                        size: 30.0,
                      ),
                    ),
                  ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
