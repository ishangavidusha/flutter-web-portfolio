import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
  _HomeSecState createState() => _HomeSecState();
}

class _HomeSecState extends State<HomeSec> with TickerProviderStateMixin {
  late Animation<double> _animationOpacity;
  late Animation<Offset> _animationOffset;
  late AnimationController _animationController;
  Uri blogUri = Uri.https("blog.ishangavidusha.com", "");

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animationOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutCirc));
    _animationOffset = Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0)).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutCirc));
    startAnimation();
    super.initState();
  }

  void startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: body(appTheme).map((e) => FadeTransition(
                opacity: _animationOpacity,
                child: SlideTransition(
                  position: _animationOffset,
                  child: e,
                ),
              )).toList(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> body(AppTheme appTheme) {
    return [
      SubTitle1("Hi, my name is", color: appTheme.primary),
      HeadLine1("Ishanga Vidusha.", isResponsive: true, textStyle: TextStyle(fontWeight: FontWeight.w900, color: appTheme.lightThree)),
      Flex(
        direction: getScreenSize(context) == ScreenSize.desktop ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeadLine2("I build things for the ", isResponsive: true, fontSize: 58, textStyle: TextStyle(fontWeight: FontWeight.w900, color: appTheme.lightTwo)),
          SizedBox(
            width: devWidth(context) * 0.3 > 300 ? 300 : devWidth(context) * 0.3 < 240 ? 240 : devWidth(context) * 0.3,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: getTextSize(context, 58),
                fontWeight: FontWeight.w900,
                color: appTheme.lightTwo,
                fontFamily: GoogleFonts.robotoSlab().fontFamily,
                letterSpacing: 1.2
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(seconds: 2),
                animatedTexts: [
                  TypewriterAnimatedText("web.", speed: const Duration(milliseconds: 100)),
                  TypewriterAnimatedText("mobile.", speed: const Duration(milliseconds: 100)),
                  TypewriterAnimatedText("desktop.", speed: const Duration(milliseconds: 100)),
                  TypewriterAnimatedText("backend.", speed: const Duration(milliseconds: 100)),
                ],
              ),
            ),
          )
        ],
      ),
      verticalSpace(value: 20),
      SizedBox(
        width: devWidth(context) * 0.5 > 500 ? devWidth(context) * 0.5 : 500.0, 
        child: Body1(
          "I'm a full-stack software developer who always like to learn new technologies and working as a freelancer at the same time. My most powerful tech stack is built around the Flutter framework and the Python and Java programming languages.",
          color: appTheme.lightOne,
        ),
      ),
      verticalSpace(value: 40),
      AppButton(
        text: "Check out my blog!",
        onPressed: () async {
          if (await canLaunch(blogUri.toString())) {
            launch(blogUri.toString());
          }
        },
      ),
    ];
  }
}