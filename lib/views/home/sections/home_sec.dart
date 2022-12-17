import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../services/theme.dart';
import '../../../utils/commons.dart';
import '../../../utils/typography.dart';
import '../../../utils/widgets/buttons.dart';

class HomeSec extends StatefulWidget {
  final GlobalKey contentKey;
  const HomeSec({
    Key? key,
    required this.contentKey,
  }) : super(key: key);

  @override
  HomeSecState createState() => HomeSecState();
}

class HomeSecState extends State<HomeSec> with TickerProviderStateMixin {
  Uri blogUri = Uri.https("blog.ishangavidusha.com", "");

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return Center(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            key: widget.contentKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: body(appTheme).map((e) => e).toList(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> body(AppTheme appTheme) {
    return [
      SubTitle1("Hi, my name is", color: appTheme.primary),
      verticalSpace(),
      HeadLine1("Ishanga Vidusha.", isResponsive: true, textStyle: TextStyle(fontWeight: FontWeight.w900, color: appTheme.lightThree)),
      Flex(
        direction: getScreenSize(context) == ScreenSize.desktop ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeadLine2("I build things for the ", isResponsive: true, fontSize: 58, textStyle: TextStyle(fontWeight: FontWeight.w900, color: appTheme.lightTwo)),
          SizedBox(
            width: min(300, max(240, devWidth(context) * 0.3)),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: getTextSize(context, 58),
                fontWeight: FontWeight.w900,
                color: appTheme.lightTwo,
                fontFamily: GoogleFonts.workSans().fontFamily,
                letterSpacing: 1.2
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(seconds: 2),
                animatedTexts: [
                  TypewriterAnimatedText("mobile.", speed: const Duration(milliseconds: 100)),
                  TypewriterAnimatedText("desktop.", speed: const Duration(milliseconds: 100)),
                  TypewriterAnimatedText("web.", speed: const Duration(milliseconds: 100)),
                  TypewriterAnimatedText("backend.", speed: const Duration(milliseconds: 100)),
                ],
              ),
            ),
          )
        ],
      ),
      verticalSpace(value: 20),
      SizedBox(
        width: max(devWidth(context) * 0.5, ScreenSize.mobile.maxWidth()), 
        child: Body1(
          "I'm a full-stack software developer who always like to learn new technologies. I'm currently working as a Flutter Engineer. My most powerful tech stack is built around the Flutter Framework & Python, Java programming languages.",
          color: appTheme.lightOne,
        ),
      ),
      verticalSpace(value: 40),
      AppButton(
        text: "Check out my blog!",
        onPressed: () async {
          if (await canLaunchUrlString(blogUri.toString())) {
            launchUrlString(blogUri.toString());
          }
        },
      ),
    ];
  }
}