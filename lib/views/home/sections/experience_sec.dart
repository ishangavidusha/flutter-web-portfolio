import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../services/theme.dart';
import '../../../utils/commons.dart';
import '../../../utils/typography.dart';

class ExperienceSec extends StatefulWidget {
  const ExperienceSec({
    Key? key,
  }) : super(key: key);

  @override
  _ExperienceSecState createState() => _ExperienceSecState();
}

class _ExperienceSecState extends State<ExperienceSec> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  Size buttonSize = const Size(120, 40);
  late AnimationController _tabAnimationController;
  late Animation<Offset> _tabAnimation;
  late ScrollController _tabScrollController;
  late PageController _pageController;

  @override
  void initState() {
    _tabScrollController = ScrollController();
    _pageController = PageController();
    _tabAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _tabAnimation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(parent: _tabAnimationController, curve: Curves.easeOutCirc)
    );
    _tabAnimationController.addListener(onUpdateValue);
    super.initState();
  }

  void goToTab(int index) {
    int currentIndex = selectedIndex;
    int nextIndex = index;
    _tabAnimationController.reset();
    _tabAnimation = Tween<Offset>(
      begin: Offset(buttonSize.width * currentIndex, buttonSize.height * currentIndex),
      end: Offset(buttonSize.width * nextIndex, buttonSize.height * nextIndex),
      ).animate(CurvedAnimation(parent: _tabAnimationController, curve: Curves.easeOutCirc)
    );
    _tabAnimationController.forward().then((value) => setState(() {selectedIndex = nextIndex;}));
  }

  void onUpdateValue() {
    setState(() {
      
    });
  }

  @override
  void dispose() {
    _tabAnimationController.dispose();
    _tabScrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = getScreenSize(context);
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 84),
        child: Column(
          crossAxisAlignment: screenSize == ScreenSize.desktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                HeadLine6("02. ", color: appTheme.primary),
                horizontalSpace(),
                HeadLine5("Experience", color: appTheme.lightThree, textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                horizontalSpace(value: 20),
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: devWidth(context) * 0.15, minWidth: 10),
                    height: 1,
                    decoration: BoxDecoration(
                      color: appTheme.lightOne.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(value: 30),
            Flex(
              direction: screenSize == ScreenSize.desktop ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  scrollDirection: screenSize == ScreenSize.desktop ? Axis.vertical : Axis.horizontal,
                  controller: _tabScrollController,
                  child: CustomPaint(
                    painter: TabIndicatorPainter(
                      buttonSize: buttonSize,
                      offset: _tabAnimation.value,
                      color: appTheme.primary,
                      direction: screenSize == ScreenSize.desktop ? Axis.vertical : Axis.horizontal,
                    ),
                    child: Flex(
                      direction: screenSize == ScreenSize.desktop ? Axis.vertical : Axis.horizontal,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            goToTab(0);
                          },
                          child: SizedBox(
                            width: buttonSize.width,
                            height: buttonSize.height,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              alignment: Alignment.centerLeft,
                              child: Caption("Elegant Media", color: selectedIndex == 0 ? appTheme.primary : appTheme.lightOne),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            goToTab(1);
                          },
                          child: SizedBox(
                            width: buttonSize.width,
                            height: buttonSize.height,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              alignment: Alignment.centerLeft,
                              child: Caption("Freelance", color: selectedIndex == 1 ? appTheme.primary : appTheme.lightOne),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            goToTab(2);
                          },
                          child: SizedBox(
                            width: buttonSize.width,
                            height: buttonSize.height,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              alignment: Alignment.centerLeft,
                              child: Caption("E9pay", color: selectedIndex == 2 ? appTheme.primary : appTheme.lightOne),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      child: eMediaBody(screenSize, appTheme, context),
                    ),
                    Positioned(
                      child: freelanceBody(screenSize, appTheme, context),
                    ),
                    Positioned(
                      child: e9payBody(screenSize, appTheme, context),
                    ),
                  ].mapIndexed((index, element) {
                    if (index == selectedIndex) {
                      return element;
                    } else {
                      return const SizedBox();
                    }
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget eMediaBody(ScreenSize screenSize, AppTheme appTheme, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0) : const EdgeInsets.only(top: 20),
          child: RichText(
            text: TextSpan(
              text: "Flutter Software Engineer ",
              style: TextStyle(
                color: appTheme.lightOne,
                fontFamily: GoogleFonts.workSans().fontFamily,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "@ Elegant Media Sri Lanka",
                  style: TextStyle(
                    color: appTheme.primary
                  )
                ),
              ]
            ),
          ),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0) : const EdgeInsets.only(top: 8.0),
          child: Caption("March 2022 - Present", color: appTheme.lightOne),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0) : const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: screenSize == ScreenSize.desktop ? 600 : devWidth(context) * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                ),
                horizontalSpace(),
                Flexible(child: SubTitle2("Write modern, performant, maintainable code for a diverse array of client and internal projects.", color: appTheme.lightOne, textOverflow: TextOverflow.ellipsis, maxLines: 5)),
              ],
            ),
          ),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0) : const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: screenSize == ScreenSize.desktop ? 600 : devWidth(context) * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                ),
                horizontalSpace(),
                Flexible(child: SubTitle2("Work with a variety of different languages, platforms, frameworks, and technologies such as Flutter, Bitbucket, Git and Trello.", color: appTheme.lightOne, textOverflow: TextOverflow.ellipsis, maxLines: 5)),
              ],
            ),
          ),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0) : const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: screenSize == ScreenSize.desktop ? 600 : devWidth(context) * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                ),
                horizontalSpace(),
                Flexible(child: SubTitle2("Collaborated with other developers to identify and alleviate software errors and inefficiencies. \n", color: appTheme.lightOne, textOverflow: TextOverflow.ellipsis, maxLines: 5)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget freelanceBody(ScreenSize screenSize, AppTheme appTheme, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0) : const EdgeInsets.only(top: 20),
          child: RichText(
            text: TextSpan(
              text: "Full-stack developer ",
              style: TextStyle(
                color: appTheme.lightOne,
                fontFamily: GoogleFonts.workSans().fontFamily,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "@ -",
                  style: TextStyle(
                    color: appTheme.primary
                  )
                ),
              ]
            ),
          ),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0) : const EdgeInsets.only(top: 8.0),
          child: Caption("April 2021 - March 2022", color: appTheme.lightOne),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0) : const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: screenSize == ScreenSize.desktop ? 600 : devWidth(context) * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                ),
                horizontalSpace(),
                Flexible(child: SubTitle2("Write modern, performant, maintainable code for a diverse array of client and internal projects.", color: appTheme.lightOne, textOverflow: TextOverflow.ellipsis, maxLines: 5)),
              ],
            ),
          ),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0) : const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: screenSize == ScreenSize.desktop ? 600 : devWidth(context) * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                ),
                horizontalSpace(),
                Flexible(child: SubTitle2("Work with a variety of different languages, platforms, frameworks, and technologies such as Flutter, Android, Kotlin, FastAPI, Python, Flask, Git and ClickUp.", color: appTheme.lightOne, textOverflow: TextOverflow.ellipsis, maxLines: 5)),
              ],
            ),
          ),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0) : const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: screenSize == ScreenSize.desktop ? 600 : devWidth(context) * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                ),
                horizontalSpace(),
                Flexible(child: SubTitle2("Communicate with multidisciplinary clients on a daily basis. \n", color: appTheme.lightOne, textOverflow: TextOverflow.ellipsis, maxLines: 5)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget e9payBody(ScreenSize screenSize, AppTheme appTheme, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0) : const EdgeInsets.only(top: 20),
          child: RichText(
            text: TextSpan(
              text: "Developer ",
              style: TextStyle(
                color: appTheme.lightOne,
                fontFamily: GoogleFonts.workSans().fontFamily,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "@ E9pay (South Korea)",
                  style: TextStyle(
                    color: appTheme.primary
                  )
                ),
              ]
            ),
          ),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0) : const EdgeInsets.only(top: 8.0),
          child: Caption("January 2020 - April 2021", color: appTheme.lightOne),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0) : const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: screenSize == ScreenSize.desktop ? 600 : devWidth(context) * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                ),
                horizontalSpace(),
                Flexible(child: SubTitle2("Worked with a team of eight developers to build and maintain a fintech platform with a hybrid Mobile application, in a well-established company located in South Korea.", color: appTheme.lightOne, textOverflow: TextOverflow.ellipsis, maxLines: 5)),
              ],
            ),
          ),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0) : const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: screenSize == ScreenSize.desktop ? 600 : devWidth(context) * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                ),
                horizontalSpace(),
                Flexible(child: SubTitle2("Developed and maintained code for in-house platform primarily using Java, JSP and jQuery with Spring Boot framework.", color: appTheme.lightOne, textOverflow: TextOverflow.ellipsis, maxLines: 5)),
              ],
            ),
          ),
        ),
        Padding(
          padding: screenSize == ScreenSize.desktop ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0) : const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: screenSize == ScreenSize.desktop ? 600 : devWidth(context) * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                ),
                horizontalSpace(),
                Flexible(child: SubTitle2("Collaborated with other developers to identify and alleviate software errors and inefficiencies.", color: appTheme.lightOne, textOverflow: TextOverflow.ellipsis, maxLines: 5)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TabIndicatorPainter extends CustomPainter {
  late Size buttonSize;
  late Offset offset;
  late Axis direction;
  late Color color;
  TabIndicatorPainter({
    required this.buttonSize,
    required this.offset,
    required this.direction,
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
    ..color = color
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;
    Paint paintShadow = Paint()
    ..color = Colors.grey.withOpacity(0.2)
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;

    if (direction == Axis.horizontal) {
      canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), paintShadow);
      canvas.drawLine(Offset(0 + offset.dx, size.height), Offset(buttonSize.width + offset.dx, size.height), paint);
    } else {
      canvas.drawLine(const Offset(0, 0), Offset(0, size.height), paintShadow);
      canvas.drawLine(Offset(0, 0 + offset.dy), Offset(0, buttonSize.height + offset.dy), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
