import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre_test/constants/icons.dart';
import 'package:qyre_test/constants/theme.dart';
import 'package:qyre_test/presentation/widgets/production_component.dart';
import 'package:qyre_test/presentation/widgets/reminder_component.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        child: Container(),
        preferredSize: const Size(double.infinity, 90),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 140,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return const ReminderComponent(title: Text('Complete your profile tooptimize your exposure in job searches.'));
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('Today’s productions', style: textTheme.bodyText1),
            const SizedBox(height: 10),
            ListView( 
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: const [
                ProductionComponent(
                  image: AssetImage(AppIcons.production1),
                  title: Text('Production Name that is Long'),
                  countryName: Text('Sweden'),
                  date: Text('Jan 14, 2022 - Feb 23, 2023 '),
                ),
                SizedBox(height: 10),
                ProductionComponent(
                  image: AssetImage(AppIcons.production2),
                  title: Text('What has bee seen very very long te...'),
                  countryName: Text('Sweden'),
                  date: Text('Jan 14, 2022 - Feb 23, 2023 '),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
