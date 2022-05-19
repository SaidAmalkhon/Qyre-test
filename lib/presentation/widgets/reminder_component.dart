import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:qyre_test/constants/icons.dart';
import 'package:qyre_test/constants/theme.dart';

class ReminderComponent extends StatelessWidget {
  final Widget title;

  const ReminderComponent({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Apptheme.gray),
      child: Column(
        children: [
          DefaultTextStyle.merge(
            child: title,
            style: textTheme.headline1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            maxLines: 2,
          ),
          const SizedBox(height: 18),
          const LinearProgressIndicator(
            value: 0.7,
            minHeight: 8,
            color: Apptheme.fadedBlue,
            backgroundColor: Apptheme.white,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const SizedBox(),
              const Spacer(),
              Text('Complete profile', style: textTheme.headline1!.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
              SvgPicture.asset(AppIcons.arrowRight),
            ],
          )
        ],
      ),
    );
  }
}
