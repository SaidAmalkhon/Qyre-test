import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'package:qyre_test/constants/theme.dart';

class CalendarComponent extends StatelessWidget {
 final  List<DateTime> generateDateList;
  const CalendarComponent({
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
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(color: Apptheme.black, borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        index == 0 ? Text('Today', style: textTheme.subtitle2) : const SizedBox(),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat(DateFormat.WEEKDAY).format(generateDateList[index]).substring(0, 3),
                          style: textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          DateFormat(DateFormat.MONTH).format(generateDateList[index]).substring(0, 3),
                          style: textTheme.subtitle1,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          Jiffy(generateDateList[index], "dd.MM.yyyy").date.toString(),
                          style: textTheme.subtitle1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
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
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}


// return ListView.separated(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: generateDateList().length,
//       separatorBuilder: (context, index) => const SizedBox(width: 8),
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           decoration: BoxDecoration(color: Apptheme.black, borderRadius: BorderRadius.circular(4)),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               index == 0 ? Text('Today', style: textTheme.subtitle2) : const SizedBox(),
//               const SizedBox(height: 4),
//               Text(
//                 DateFormat(DateFormat.WEEKDAY).format(generateDateList()[index]).substring(0, 3),
//                 style: textTheme.subtitle1!.copyWith(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 12,
//                 ),
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 DateFormat(DateFormat.MONTH).format(generateDateList()[index]).substring(0, 3),
//                 style: textTheme.subtitle1,
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 Jiffy(generateDateList()[index], "dd.MM.yyyy").date.toString(),
//                 style: textTheme.subtitle1!.copyWith(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
