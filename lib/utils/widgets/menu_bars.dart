import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ishangavidusha/utils/typography.dart';

import '../../services/theme.dart';

class MenuBar extends StatefulWidget {
  final List<Widget> items;
  final ScrollController controller;
  final VoidCallback onClickLogo;
  const MenuBar({
    Key? key,
    required this.items,
    required this.controller,
    required this.onClickLogo,
  }) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  double animateValue = 0;

  @override
  void initState() {
    widget.controller.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    if (widget.controller.hasClients && mounted) {
      double value = ((widget.controller.offset / 100) * 2);
      setState(() {
        animateValue = value > 10 ? 10 : value;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: max(0.001, animateValue * 3), sigmaY: max(0.001, animateValue * 3)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: appTheme.darkThree.withAlpha((min(animateValue * 4, 255)).toInt())
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppLogo(onTap: widget.onClickLogo),
                const Spacer(),
                ...widget.items,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  final VoidCallback onTap;
  const AppLogo({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: HeadLine4(
          "IV",
          color: appTheme.primary,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}