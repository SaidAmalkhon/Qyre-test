import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qyre_test/constants/theme.dart';

class CalendarComponent extends StatefulWidget {
  const CalendarComponent({Key? key}) : super(key: key);

  @override
  State<CalendarComponent> createState() => _CalendarComponentState();
}

class _CalendarComponentState extends State<CalendarComponent> {
  List<DateTime> generateDateList() {
    var dayList = List.generate(30, (index) => DateTime.now().add(Duration(days: index)));
    return dayList;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView.separated(
      itemCount: generateDateList().length,
      separatorBuilder: (context, index) => const SizedBox(width: 8),
      itemBuilder: (BuildContext context, int index) {
        return AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(color: Apptheme.black, borderRadius: BorderRadius.circular(4)),
          duration: const Duration(milliseconds: 300),
          child: Column(
            children: [
              index == 0 ? Text('Today', style: textTheme.subtitle2) : const SizedBox(),
              const SizedBox(height: 4),
              Text(
                DateFormat(DateFormat.WEEKDAY).format(generateDateList()[index]).substring(0, 3),
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                DateFormat(DateFormat.MONTH).format(generateDateList()[index]).substring(0, 3),
                style: textTheme.subtitle1,
              ),
              const SizedBox(height: 2),
              Text(
                Jiffy(generateDateList()[index], "dd.MM.yyyy").date.toString(),
                style: textTheme.subtitle1!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
