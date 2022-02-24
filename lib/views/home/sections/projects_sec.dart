import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/theme.dart';
import '../../../utils/commons.dart';
import '../../../utils/typography.dart';

class ProjectsSec extends StatefulWidget {
  const ProjectsSec({
    Key? key,
  }) : super(key: key);

  @override
  _ProjectsSecState createState() => _ProjectsSecState();
}

class _ProjectsSecState extends State<ProjectsSec> {
  List<ProjectInfo> projectInfo = [
    ProjectInfo(
      title: "Python SDK for Send.lk SMS Gateway",
      body: "Build and maintain open-source Python library for send.lk SMS Gateway With added inbuilt features for Mobile OTP validation.",
      tags: const ["Python", "Request", "API", "Cryptography"],
      url: Uri.https("github.com", "/ishangavidusha/sendlk-sdk-python"),
    ),
    ProjectInfo(
      title: "Personalized News Recommendation Service",
      body: "Service that generates news headlines and summaries of the news according to user personalization using k-means clustering.",
      tags: const ["Python", "Deep learning", "RNN"],
      url: Uri.https("github.com", "/Juyoung4/MUD"),
    ),
    ProjectInfo(
      title: "Particle Network with Flutter",
      body: "Particle Network animation with flutter just under 200 lines. And also with mouse interaction.",
      tags: const ["Flutter", "Canvas", "2D"],
      url: Uri.https("github.com", "/ishangavidusha/particle-animation"),
    ),
    ProjectInfo(
      title: "3D Sphere in 2D Canvas with Flutter",
      body: "Rendering Fake 3D Sphere in 2D Canvas. This is how we can render 3D by only using the Flutter CustomPainter Canvas",
      tags: const ["Flutter", "Canvas", "3D"],
      url: Uri.https("github.com", "/ishangavidusha/3d-sphere-flutter"),
    ),
    ProjectInfo(
      title: "Windows Application with Flutter",
      body: "This application is designed to do some specific work that required for the client company.",
      tags: const ["Flutter", "Windows", "PDF"],
      url: Uri.https("github.com", "/ishangavidusha/E9pass-Manager-Native"),
    ),
    ProjectInfo(
      title: "Declarative Routing Template",
      body: "Fully functional declarative routing template for Flutter with authentication flow.",
      tags: const ["Flutter", "GoRouter", "Provider"],
      url: Uri.https("github.com", "/ishangavidusha/flutter-go-router-example"),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 84),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeadLine5("Other Noteworthy Projects", color: appTheme.lightThree, textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            verticalSpace(value: 30),
            SizedBox(
              width: min(ScreenSize.desktop.maxWidth(), devWidth(context)),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: devWidth(context) > ScreenSize.desktop.maxWidth() ? 3 : devWidth(context) > ScreenSize.tablet.maxWidth() ? 2 : 1,
                  childAspectRatio: devWidth(context) < ScreenSize.desktop.maxWidth() ? 1.2 : 1.0
                ),
                itemCount: projectInfo.length,
                shrinkWrap: true,
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ProjectTile(
                      title: projectInfo[index].title,
                      body: projectInfo[index].body,
                      tags: projectInfo[index].tags,
                      onTap: () {
                        if (projectInfo[index].url != null) {
                          launch(projectInfo[index].url.toString());
                        }
                      },
                    )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectTile extends StatefulWidget {
  final String title;
  final String body;
  final List<String> tags;
  final VoidCallback onTap;
  const ProjectTile({
    Key? key,
    required this.title,
    required this.body,
    required this.tags,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> with SingleTickerProviderStateMixin {
  bool isHover = false;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0, end: -6).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return MouseRegion(
          onEnter: (event) {
            if (!_animationController.isCompleted) {
              _animationController.forward();
            } else {
              _animationController.reset();
            }
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.reset();
            }
            setState(() {
              isHover = false;
            });
          },
          cursor: SystemMouseCursors.click,
          child: Transform.translate(
            offset: Offset(0, _animation.value),
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: appTheme.darkTwo,
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 24,
                      offset: const Offset(0, 6)
                    ),
                  ]
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.folder, size: 36, color: appTheme.primary),
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.externalLinkAlt, size: 18),
                            splashRadius: 20,
                            color: appTheme.lightTwo,
                            padding: EdgeInsets.zero,
                            onPressed: widget.onTap
                          ),
                        ],
                      ),
                      verticalSpace(value: 20),
                      HeadLine6(widget.title, color: isHover ? appTheme.primary : appTheme.lightThree, fontSize: 18, textStyle: const TextStyle(fontWeight: FontWeight.bold),),
                      verticalSpace(value: 12),
                      Body2(widget.body, color: appTheme.lightTwo),
                      verticalSpace(value: 16),
                      Caption(widget.tags.join("   "), color: appTheme.lightTwo, textOverflow: TextOverflow.ellipsis, maxLines: 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

class ProjectInfo {
  String title;
  String body;
  List<String> tags;
  Uri? url;
  ProjectInfo({
    required this.title,
    required this.body,
    required this.tags,
    this.url,
  });
}
