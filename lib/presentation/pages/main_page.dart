import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre_test/constants/icons.dart';
import 'package:qyre_test/constants/theme.dart';
import 'package:qyre_test/presentation/widgets/calendart_component.dart';
import 'package:qyre_test/presentation/widgets/outstaff_componet.dart';
import 'package:qyre_test/presentation/widgets/production_component.dart';
import 'package:qyre_test/presentation/widgets/reduced_days.dart';
import 'package:qyre_test/presentation/widgets/reminder_component.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<DateTime> generateDateList() {
    var dayList = List.generate(30, (index) => DateTime.now().add(Duration(days: index)));
    return dayList;
  }

  bool _isAppBarExtended = false;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels <= 64.0) {
      if (_isAppBarExtended) _isAppBarExtended = false;
    } else {
      if (!_isAppBarExtended) _isAppBarExtended = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(height: 80),
                CalendarComponent(generateDateList: generateDateList()),
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutstaffComponent(
                        firstColor: Apptheme.blue,
                        secondColor: Apptheme.lightBlue,
                        title: const Text('My network'),
                        subtitle: const Text('Connect and grow your network'),
                        icon: SvgPicture.asset(AppIcons.network),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: OutstaffComponent(
                        firstColor: Apptheme.orange,
                        secondColor: Apptheme.lightOrange,
                        title: const Text('Quick here'),
                        subtitle: const Text('Hire someone quickly today'),
                        icon: SvgPicture.asset(AppIcons.qyre),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: OutstaffComponent(
                        firstColor: Apptheme.purple,
                        secondColor: Apptheme.lightPurple,
                        title: const Text('My CV'),
                        subtitle: const Text('Kepp your CV updated to get the best offers'),
                        icon: SvgPicture.asset(AppIcons.cv),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text('My job offers', style: textTheme.bodyText1),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 20, right: 16, left: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Apptheme.gray,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.todoList),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Job offers are shown here! Keep your profile updated to stay relevant for new opportunities.',
                              style: textTheme.bodyText2!.copyWith(fontSize: 15),
                              maxLines: 3,
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Text('Go to my profile  ', style: textTheme.headline2!.copyWith(fontWeight: FontWeight.w500)),
                                SvgPicture.asset(AppIcons.arrowRight),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text('Starred posts', style: textTheme.bodyText1),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 20, right: 16, left: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Apptheme.gray,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.stars),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Posts that are extra relevant to you can be marked with a star and will be shown here for easy access.',
                          style: textTheme.bodyText2!.copyWith(fontSize: 15),
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 90,
            width: double.infinity,
            child: ClipRRect(
              child: Align(
                alignment: Alignment.centerLeft,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 90.0, sigmaY: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 15),
                    child: Text(
                      'My Availability',
                      style: textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          _isAppBarExtended
              ? Positioned(
                  top: 90.0,
                  width: MediaQuery.of(context).size.width,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOutCubic,
                    height: 43,
                    child: ClipRRect(
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 90.0, sigmaY: 10.0), child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: ReducedDays(generateDateList: generateDateList()),
                            ))),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
