import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/theme.dart';
import '../../../utils/commons.dart';

class ProjectsSec extends StatefulWidget {
  final GlobalKey contentKey;
  const ProjectsSec({
    Key? key,
    required this.contentKey,
  }) : super(key: key);

  @override
  _ProjectsSecState createState() => _ProjectsSecState();
}

class _ProjectsSecState extends State<ProjectsSec> {
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
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}