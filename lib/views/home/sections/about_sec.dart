import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../services/theme.dart';
import '../../../utils/commons.dart';
import '../../../utils/typography.dart';

class AboutSec extends StatefulWidget {
  final GlobalKey contentKey;
  const AboutSec({
    Key? key,
    required this.contentKey,
  }) : super(key: key);

  @override
  _AboutSecState createState() => _AboutSecState();
}

class _AboutSecState extends State<AboutSec> {
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = getScreenSize(context);
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return Center(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            key: widget.contentKey,
            child: Column(
              crossAxisAlignment: screenSize == ScreenSize.desktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeadLine6("01. ", color: appTheme.primary),
                    horizontalSpace(),
                    HeadLine5("About Me", color: appTheme.lightThree, textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                    horizontalSpace(value: 20),
                    Container(
                      width: devWidth(context) * 0.15,
                      height: 1,
                      decoration: BoxDecoration(
                        color: appTheme.lightOne.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
                verticalSpace(value: 30),
                Flex(
                  direction: screenSize == ScreenSize.desktop ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: screenSize == ScreenSize.desktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: screenSize == ScreenSize.desktop ? 450 : devWidth(context),
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "I'm a full-stack software developer who constantly seeks out innovative solutions to everyday problems. In my five years plus experience in Mobile app and backend development in the IT field, I've honed my analytical thinking and collaboration skills, and I love working with new ideas and innovations. I've also had the opportunity to work as Intern Java full stack developer on a fintech company based in South Korea.",
                              style: TextStyle(
                                color: appTheme.lightOne,
                                fontFamily: GoogleFonts.robotoSlab().fontFamily,
                                fontSize: 16,
                              ),
                              children: [
                                const TextSpan(
                                  text: "\n\n"
                                ),
                                TextSpan(
                                  text: "I was a 4th-year Infomation Technology undergraduate student of the Hankuk University in South Korea.",
                                  style: TextStyle(
                                    color: appTheme.primary
                                  )
                                ),
                                const TextSpan(
                                  text: " But currently, I'm living in Sri Lanka because in 2021 I decided to leave the university because of COVID 19 pandemic situation and some personal issues I face during that period.",
                                ),
                                const TextSpan(
                                  text: "\n\n"
                                ),
                                const TextSpan(
                                  text: "As a developer, I always tend to learn new technologies and trending design patterns. that's made a huge impact on when I decided to learn the flutter framework and it's made me an expert in the relevant area of development.",
                                ),
                                const TextSpan(
                                  text: "\n\n"
                                ),
                                const TextSpan(
                                  text: "Here are a few technologies I’ve been working with recently:"
                                ),
                              ]
                            ),
                          ),
                          verticalSpace(value: 20),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                                        horizontalSpace(),
                                        Caption("Flutter", color: appTheme.lightOne),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                                        horizontalSpace(),
                                        Caption("Firebase", color: appTheme.lightOne),
                                      ],
                                    ),
                                  ),
                                ]
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                                        horizontalSpace(),
                                        Caption("FastAPI", color: appTheme.lightOne),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                                        horizontalSpace(),
                                        Caption("Git", color: appTheme.lightOne),
                                      ],
                                    ),
                                  ),
                                ]
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                                        horizontalSpace(),
                                        Caption("GCP App Engin", color: appTheme.lightOne),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.caretRight, color: appTheme.primary, size: 12),
                                        horizontalSpace(),
                                        Caption("Docker", color: appTheme.lightOne),
                                      ],
                                    ),
                                  ),
                                ]
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: screenSize == ScreenSize.desktop ? 0 : 24),
                      child: const ProfileImage(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  double offsetValue = 20;
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = getScreenSize(context);
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
          offsetValue = 14;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
          offsetValue = 20;
        });
      },
      child: SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: offsetValue,
              top: offsetValue,
              right: offsetValue * -1,
              bottom: offsetValue * -1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: appTheme.primary,
                    width: 1.0
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network("https://i.ibb.co/tP5Wz4z/website-profile.jpg"),
              ),
            ),
            Positioned.fill(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isHover ? null : appTheme.primary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}