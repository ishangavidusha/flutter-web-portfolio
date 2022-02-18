import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/theme.dart';
import '../../../utils/commons.dart';
import '../../../utils/typography.dart';

class ExperienceSec extends StatefulWidget {
  final GlobalKey contentKey;
  const ExperienceSec({
    Key? key,
    required this.contentKey,
  }) : super(key: key);

  @override
  _ExperienceSecState createState() => _ExperienceSecState();
}

class _ExperienceSecState extends State<ExperienceSec> {
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
                    HeadLine6("02. ", color: appTheme.primary),
                    horizontalSpace(),
                    HeadLine5("Experience", color: appTheme.lightThree, textStyle: const TextStyle(fontWeight: FontWeight.bold)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}