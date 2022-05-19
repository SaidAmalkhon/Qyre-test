import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:qyre_test/constants/icons.dart';
import 'package:qyre_test/constants/theme.dart';

class ProductionComponent extends StatelessWidget {
  final Widget title;
  final Widget countryName;
  final Widget date;
  final ImageProvider image;
  const ProductionComponent({
    Key? key,
    required this.title,
    required this.countryName,
    required this.date, 
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
            height: 70,
            child: ClipRRect(
              child: Image(image: image,),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: const BoxDecoration(
                  color: Apptheme.gray,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  )),
              child: Row(
                children: [
                  Column(
                    children: [
                      DefaultTextStyle.merge(child: title, style: textTheme.headline2),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          DefaultTextStyle.merge(child: countryName, style: textTheme.bodyText2),
                          const SizedBox(width: 6),
                          DefaultTextStyle.merge(child: date, style: textTheme.bodyText2),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.arrowRight)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
