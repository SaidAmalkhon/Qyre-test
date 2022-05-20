import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'package:qyre_test/constants/theme.dart';

class ReducedDays extends StatelessWidget {
  final List<DateTime> generateDateList;
  const ReducedDays({
    Key? key,
    required this.generateDateList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
              generateDateList.length,
              (index) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
                    decoration: BoxDecoration(color: Apptheme.black, borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            index == 0 ? Text('Today ', style: textTheme.subtitle2) : const SizedBox(),
                            Text(
                              DateFormat(DateFormat.WEEKDAY).format(generateDateList[index]).substring(0, 3),
                              style: textTheme.subtitle1!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            index % 3 == 0
                                ? Container(
                                    height: 8,
                                    width: 8,
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Apptheme.orange),
                                  )
                                : const SizedBox(),
                            index % 3 == 2
                                ? Container(
                                    height: 8,
                                    width: 8,
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Apptheme.fadedBlue),
                                  )
                                : const SizedBox(),
                            Text(
                              Jiffy(generateDateList[index], "dd.MM.yyyy").date.toString(),
                              style: textTheme.subtitle1!.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              DateFormat(DateFormat.MONTH).format(generateDateList[index]).substring(0, 3),
                              style: textTheme.subtitle1!.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                          ],
                        ),
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
