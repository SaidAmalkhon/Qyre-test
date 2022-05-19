import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:qyre_test/constants/icons.dart';
import 'package:qyre_test/constants/theme.dart';

class OutstaffComponent extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget icon;
  final Color firstColor;
  final Color secondColor;
  const OutstaffComponent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.firstColor,
    required this.secondColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            colors: [ firstColor, secondColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         icon,
          const SizedBox(height: 12),
          DefaultTextStyle.merge(style: textTheme.headline1!.copyWith(color: Apptheme.white, fontSize: 14), child: title),
          const SizedBox(height: 3),
          DefaultTextStyle.merge(
              child: subtitle, style: textTheme.subtitle1, maxLines: 3, overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}
