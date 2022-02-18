import 'package:flutter/material.dart';

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
  double homeContentHeight = 0;
  double aboutContentHeight = 0;
  double experienceContentHeight = 0;

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
    setState(() {
      homeContentHeight = homeSize.height;
      aboutContentHeight = aboutSize.height;
      experienceContentHeight = experienceSize.height;
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
                        height: homeContentHeight < devHeight(context) ? devHeight(context) : homeContentHeight,
                        child: HomeSec(contentKey: _homeSecKey),
                      ),
                      SizedBox(
                        width: devWidth(context),
                        height: aboutContentHeight < devHeight(context) ? devHeight(context) : aboutContentHeight,
                        child: AboutSec(contentKey: _aboutSecKey),
                      ),
                      SizedBox(
                        width: devWidth(context),
                        height: experienceContentHeight < devHeight(context) ? devHeight(context) : experienceContentHeight,
                        child: ExperienceSec(contentKey: _experienceSecKey),
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