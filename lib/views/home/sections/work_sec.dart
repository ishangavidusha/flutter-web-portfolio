import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/theme.dart';
import '../../../utils/commons.dart';
import '../../../utils/typography.dart';

class WorkSec extends StatefulWidget {
  final GlobalKey contentKey;
  const WorkSec({
    Key? key,
    required this.contentKey,
  }) : super(key: key);

  @override
  _WorkSecState createState() => _WorkSecState();
}

class _WorkSecState extends State<WorkSec> {
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = getScreenSize(context);
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return Center(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Padding(
            key: widget.contentKey,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: screenSize == ScreenSize.desktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeadLine6("03. ", color: appTheme.primary),
                    horizontalSpace(),
                    HeadLine5("Some Things I’ve Built", color: appTheme.lightThree, textStyle: const TextStyle(fontWeight: FontWeight.bold)),
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
                verticalSpace(value: 10),
                WorkCard(
                  imageUrl: "https://i.ibb.co/4dfk0Hm/beefoods.jpg",
                  title: "BeeFoods Lanka",
                  body: "A fully responsive and functional website with Flutter. Hosted with firebase and SMS Getaway API attached using Python (Cloud Function). CI/CD integrated with GCP Cloud Build.",
                  tags: const ["Flutter","Firebase","GoRouter","SendLK"],
                  external: Uri.https("beefoodslanka.com", ""),
                ),
                verticalSpace(),
                WorkCard(
                  imageUrl: "https://i.ibb.co/BwcCYV5/e9pass-app.jpg",
                  title: "E9pay CS",
                  body: "This is an internal service application of the client company that create using the Flutter framework. It has features like Generate PDF, Read QR Code, Google drive sync, etc...",
                  tags: const ["Flutter","Google Login","PDF","QR Code", "Drive Sync"],
                  github: Uri.https("github.com", "/ishangavidusha/E9pass-CS"),
                  ltr: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String body;
  final List<String> tags;
  final Uri? external;
  final Uri? github;
  final bool ltr;
  const WorkCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.body,
    required this.tags,
    this.external,
    this.github,
    this.ltr = true,
  }) : super(key: key);

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = getScreenSize(context);
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return SizedBox(
      width: max(min(devWidth(context), ScreenSize.tablet.maxWidth()), ScreenSize.mobile.maxWidth()),
      height: max(min(devWidth(context), ScreenSize.tablet.maxWidth()), ScreenSize.mobile.maxWidth()) * 0.5,
      child: Stack(
        children: [
          Positioned(
            left: widget.ltr ? 0 : screenSize == ScreenSize.desktop ? max(min(devWidth(context), ScreenSize.tablet.maxWidth()), ScreenSize.mobile.maxWidth()) * 0.4 : 0,
            right: widget.ltr ? screenSize == ScreenSize.desktop ? max(min(devWidth(context), ScreenSize.tablet.maxWidth()), ScreenSize.mobile.maxWidth()) * 0.4 : 0 : 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: MouseRegion(
                onEnter: (event) {
                  setState(() {
                    isHover = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    isHover = false;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    widget.imageUrl,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          color: appTheme.darkTwo.withOpacity(0.5),
                          child: Icon(FontAwesomeIcons.stopCircle, color: appTheme.red),
                        ),
                      );
                    },
                    fit: BoxFit.fitWidth,
                    colorBlendMode: (isHover && screenSize == ScreenSize.desktop) ? BlendMode.srcIn : BlendMode.srcATop,
                    color: (isHover && screenSize == ScreenSize.desktop) ? null : screenSize == ScreenSize.desktop ? appTheme.darkOne.withOpacity(0.4) : appTheme.darkOne.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: widget.ltr ? 0 : screenSize == ScreenSize.desktop ? max(min(devWidth(context), ScreenSize.tablet.maxWidth()), ScreenSize.mobile.maxWidth()) * 0.4 : 0,
            left: widget.ltr ? screenSize == ScreenSize.desktop ? max(min(devWidth(context), ScreenSize.tablet.maxWidth()), ScreenSize.mobile.maxWidth()) * 0.4 : 0 : 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: !widget.ltr ? MainAxisAlignment.start : screenSize == ScreenSize.desktop ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          SubTitle2("Featured Project", color: appTheme.primary),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: !widget.ltr ? MainAxisAlignment.start : screenSize == ScreenSize.desktop ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          HeadLine5(widget.title, color: appTheme.lightThree, textStyle: const TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      verticalSpace(value: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: appTheme.darkTwo,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          mainAxisAlignment: !widget.ltr ? MainAxisAlignment.start : screenSize == ScreenSize.desktop ? MainAxisAlignment.end : MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Body2(
                                widget.body,
                                color: appTheme.lightTwo,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                maxLines: 5,
                                textAlign: !widget.ltr ? TextAlign.start : screenSize == ScreenSize.desktop ? TextAlign.end : TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(),
                      Row(
                        mainAxisAlignment: !widget.ltr ? MainAxisAlignment.start : screenSize == ScreenSize.desktop ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          Caption(widget.tags.join("   "), color: appTheme.lightTwo),
                        ],
                      ),
                      verticalSpace(),
                      Row(
                        mainAxisAlignment: !widget.ltr ? MainAxisAlignment.start : screenSize == ScreenSize.desktop ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          if (widget.github != null) IconButton(
                            icon: const Icon(FontAwesomeIcons.github, size: 16),
                            splashRadius: 18,
                            color: appTheme.lightTwo,
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              if(await canLaunch(widget.github.toString())) {
                                launch(widget.github.toString());
                              }
                            },
                          ),
                          horizontalSpace(),
                          if (widget.external != null) IconButton(
                            icon: const Icon(FontAwesomeIcons.externalLinkSquareAlt, size: 16),
                            splashRadius: 18,
                            color: appTheme.lightTwo,
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              if(await canLaunch(widget.external.toString())) {
                                launch(widget.external.toString());
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}