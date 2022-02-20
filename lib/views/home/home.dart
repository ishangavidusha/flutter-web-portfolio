import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ishangavidusha/views/home/sections/projects_sec.dart';
import 'package:ishangavidusha/views/home/sections/work_sec.dart';

import '../../utils/commons.dart';
import 'sections/about_sec.dart';
import 'sections/experience_sec.dart';
import 'sections/home_sec.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  final GlobalKey _homeSecKey = GlobalKey();
  final GlobalKey _aboutSecKey = GlobalKey();
  final GlobalKey _experienceSecKey = GlobalKey();
  final GlobalKey _workSecKey = GlobalKey();
  final GlobalKey _projectsSecKey = GlobalKey();
  double homeContentHeight = 0;
  double aboutContentHeight = 0;
  double experienceContentHeight = 0;
  double workContentHeight = 0;
  double projectsContentHeight = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);
    WidgetsBinding.instance?.addPostFrameCallback((_) => getContentHeight());
    super.initState();
  }

  void onScroll() {

  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    getContentHeight();
    super.didUpdateWidget(oldWidget);
  }

  void getContentHeight() {
    Size homeSize = _homeSecKey.currentContext?.size ?? Size(0, homeContentHeight);
    Size aboutSize = _aboutSecKey.currentContext?.size ?? Size(0, aboutContentHeight);
    Size experienceSize = _experienceSecKey.currentContext?.size ?? Size(0, experienceContentHeight);
    Size workSize = _workSecKey.currentContext?.size ?? Size(0, workContentHeight);
    Size projectsSize = _projectsSecKey.currentContext?.size ?? Size(0, projectsContentHeight);
    setState(() {
      homeContentHeight = homeSize.height;
      aboutContentHeight = aboutSize.height;
      experienceContentHeight = experienceSize.height;
      workContentHeight = workSize.height;
      projectsContentHeight = projectsSize.height;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (SizeChangedLayoutNotification notification) {
          Future.delayed(const Duration(milliseconds: 100)).then((_) => getContentHeight());
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
                        width: devWidth(context),
                        height: max(devHeight(context), homeContentHeight),
                        child: HomeSec(contentKey: _homeSecKey),
                      ),
                      SizedBox(
                        width: devWidth(context),
                        height: max(min(devHeight(context), aboutContentHeight + 160), aboutContentHeight),
                        child: AboutSec(contentKey: _aboutSecKey),
                      ),
                      SizedBox(
                        width: devWidth(context),
                        height: max(min(devHeight(context), experienceContentHeight + 160), experienceContentHeight),
                        child: ExperienceSec(contentKey: _experienceSecKey),
                      ),
                      SizedBox(
                        width: devWidth(context),
                        height: max(min(devHeight(context), workContentHeight + 160), workContentHeight),
                        child: WorkSec(contentKey: _workSecKey),
                      ),
                      SizedBox(
                        width: devWidth(context),
                        height: max(min(devHeight(context), projectsContentHeight + 160), projectsContentHeight),
                        child: ProjectsSec(contentKey: _projectsSecKey),
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}