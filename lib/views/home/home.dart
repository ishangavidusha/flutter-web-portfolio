import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ishangavidusha/utils/widgets/menu_bars.dart';

import '../../services/theme.dart';
import '../../utils/commons.dart';
import '../../utils/keys.dart';
import '../../utils/widgets/buttons.dart';
import 'sections/about_sec.dart';
import 'sections/contact_sec.dart';
import 'sections/experience_sec.dart';
import 'sections/home_sec.dart';
import 'sections/projects_sec.dart';
import 'sections/work_sec.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late Animation<double> _homeSecAnimation;
  late Animation<double> _menuBarAnimation;
  late AnimationController _homeSecAnimationController;
  late AnimationController _buttonAnimationController;
  late AnimationController _menuBarAnimationController;
  late ScrollController _scrollController;
  double homeContentHeight = 0;

  bool isDrawerOpen = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _homeSecAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _buttonAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _menuBarAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _homeSecAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _homeSecAnimationController, curve: Curves.easeOutCirc));
    _menuBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _menuBarAnimationController, curve: Curves.easeOutCirc));
    WidgetsBinding.instance?.addPostFrameCallback((_) => getContentHeight());
    WidgetsBinding.instance?.addPostFrameCallback((_) => startAnimation());
    super.initState();
  }

  void startAnimation() {
    _menuBarAnimationController.forward().then((value) => _homeSecAnimationController.forward());
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => getContentHeight());
    super.didUpdateWidget(oldWidget);
  }

  void scrollTo(GlobalKey _key) {
    if (_scrollController.hasClients) {
      double currentOffset = _scrollController.offset;
      RenderBox? renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
      Offset position = renderBox?.localToGlobal(Offset(0, currentOffset)) ?? const Offset(0, 0);
      _scrollController.animateTo(position.dy, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void scrollToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void getContentHeight() {
    setState(() {
      homeContentHeight = getRenderBoxHeight(homeContentKey);
    });
  }

  double getRenderBoxHeight(GlobalKey _key) {
    RenderBox? renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.height ?? 0;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _homeSecAnimationController.dispose();
    _buttonAnimationController.dispose();
    _menuBarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return Scaffold(
      key: scaffoldKey,
      drawer: SizedBox(
        width: 300,
        height: devHeight(context),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              decoration: BoxDecoration(
                color: appTheme.darkThree.withOpacity(0.4),
              ),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MenuButton(
                        prefixText: "01.",
                        text: "About",
                        onTap: () {
                          scrollTo(aboutPositionKey);
                          Navigator.pop(context);
                        },
                      ),
                      MenuButton(
                        prefixText: "02.",
                        text: "Experience",
                        onTap: () {
                          scrollTo(experiencePositionKey);
                          Navigator.pop(context);
                        },
                      ),
                      MenuButton(
                        prefixText: "03.",
                        text: "Work",
                        onTap: () {
                          scrollTo(workPositionKey);
                          Navigator.pop(context);
                        },
                      ),
                      MenuButton(
                        prefixText: "04.",
                        text: "Contact",
                        onTap: () {
                          scrollToEnd();
                          Navigator.pop(context);
                        },
                      ),
                    ].map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: e,
                    )).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      onDrawerChanged: (value) {
        setState(() {
          isDrawerOpen = value;
        });
        if (!value && _buttonAnimationController.isCompleted) {
          _buttonAnimationController.reverse();
        }
      },
      body: NotificationListener(
        onNotification: (SizeChangedLayoutNotification notification) {
          WidgetsBinding.instance?.addPostFrameCallback((_) => getContentHeight());
          return true;
        },
        child: SizeChangedLayoutNotifier(
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        key: homePositionKey,
                        width: devWidth(context),
                        height: max(devHeight(context), homeContentHeight),
                        child: FadeTransition(
                          opacity: _homeSecAnimation,
                          child: SlideTransition(
                            position: _homeSecAnimation.drive(Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)),
                            child: HomeSec(contentKey: homeContentKey),
                          ),
                        ),
                      ),
                      SizedBox(
                        key: aboutPositionKey,
                        width: devWidth(context),
                        child: const AboutSec(),
                      ),
                      SizedBox(
                        key: experiencePositionKey,
                        width: devWidth(context),
                        child: const ExperienceSec(),
                      ),
                      SizedBox(
                        key: workPositionKey,
                        width: devWidth(context),
                        child: const WorkSec(),
                      ),
                      SizedBox(
                        key: projectsPositionKey,
                        width: devWidth(context),
                        child: const ProjectsSec(),
                      ),
                      SizedBox(
                        key: contactPositionKey,
                        width: devWidth(context),
                        child: const ContactSec(),
                      ),
                      Container(
                        width: devWidth(context),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            ClickableText(
                              text: "Designed by Brittany Chiang",
                              onTap: () {
                                launch("https://brittanychiang.com/");
                              },
                            ),
                            verticalSpace(),
                            ClickableText(
                              text: "Build with Flutter by Ishanga Vidusha",
                              onTap: () {
                                launch("https://github.com/ishangavidusha/flutter-web-portfolio");
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
              Positioned(
                top: 0,
                width: devWidth(context),
                child: SlideTransition(
                  position: _menuBarAnimation.drive(Tween<Offset>(begin: const Offset(0, -2.0), end: Offset.zero)),
                  child: FadeTransition(
                    opacity: _menuBarAnimation,
                    child: MenuBar(
                      items: getMenuButtons(context, appTheme),
                      controller: _scrollController,
                      onClickLogo: () {
                        scrollTo(homePositionKey);
                      },
                    ),
                  ),
                ),
              ),
              if (devWidth(context) > ScreenSize.desktop.maxWidth()) Positioned(
                left: 0,
                bottom: 0,
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconsButton(
                      icon: FontAwesomeIcons.github,
                      onTap: () {
                        launch("https://github.com/ishangavidusha");
                      },
                    ),
                    IconsButton(
                      icon: FontAwesomeIcons.instagram,
                      onTap: () {
                        launch("https://www.instagram.com/ishanga_vidusha");
                      },
                    ),
                    IconsButton(
                      icon: FontAwesomeIcons.twitter,
                      onTap: () {
                        launch("https://twitter.com/ishangavidusha");
                      },
                    ),
                    verticalSpace(value: 20),
                    Container(
                      width: 1,
                      height: devHeight(context) * 0.15,
                      decoration: BoxDecoration(
                        color: appTheme.lightOne.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )
                  ]
                ),
              ),
              if (devWidth(context) > ScreenSize.desktop.maxWidth()) Positioned(
                right: 0,
                bottom: 0,
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconsButton(
                      text: "ishangavidusha@gmail.com",
                      onTap: () {},
                    ),
                    verticalSpace(value: 20),
                    Container(
                      width: 1,
                      height: devHeight(context) * 0.15,
                      decoration: BoxDecoration(
                        color: appTheme.lightOne.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getMenuButtons(BuildContext context, AppTheme appTheme) {
    if (devWidth(context) > ScreenSize.tablet.maxWidth()) {
      return [
        MenuButton(
          prefixText: "01.",
          text: "About",
          onTap: () {
            scrollTo(aboutPositionKey);
          },
        ),
        MenuButton(
          prefixText: "02.",
          text: "Experience",
          onTap: () {
            scrollTo(experiencePositionKey);
          },
        ),
        MenuButton(
          prefixText: "03.",
          text: "Work",
          onTap: () {
            scrollTo(workPositionKey);
          },
        ),
        MenuButton(
          prefixText: "04.",
          text: "Contact",
          onTap: () {
            scrollToEnd();
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _buttonAnimationController,
          ),
          iconSize: 28,
          color: appTheme.primary,
          splashRadius: 32,
          onPressed: () {
            if (!isDrawerOpen) {
              _buttonAnimationController.forward();
              scaffoldKey.currentState?.openDrawer();
            }
          },
        ),
      ];
    }
  }
}
