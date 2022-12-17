import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ishangavidusha/utils/typography.dart';

import '../../services/theme.dart';

class MenuBar extends StatefulWidget {
  final List<Widget> items;
  final ScrollController controller;
  final AnimationController menuAnimationController;
  final VoidCallback onClickLogo;
  const MenuBar({
    Key? key,
    required this.items,
    required this.controller,
    required this.menuAnimationController,
    required this.onClickLogo,
  }) : super(key: key);

  @override
  MenuBarState createState() => MenuBarState();
}

class MenuBarState extends State<MenuBar> with SingleTickerProviderStateMixin {
  double animateValue = 0;
  int itemAnimationDuration = 1000;

  late AnimationController _animationController;
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    widget.controller.addListener(scrollListener);
    widget.menuAnimationController.addListener(menuAnimationCompleted);
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: itemAnimationDuration));
    setAnimations();
    super.initState();
  }

  void setAnimations() {
    int length = widget.items.length;
    int oneItemDuration = itemAnimationDuration ~/ length;
    for (var element in widget.items) {
      int index = widget.items.indexOf(element);
      double startAt = index * oneItemDuration / itemAnimationDuration;
      double endAt = (index + 1) * oneItemDuration / itemAnimationDuration;
      if (index != 0) {
        startAt -= 0.1;
      }
      if (index != length - 1) {
        endAt += 0.1;
      }
      if (index == length - 1) {
        endAt = 1;
      } else if (index == 0) {
        startAt = 0;
      }
      _animations.add(Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Interval(startAt, endAt, curve: Curves.easeInOut))));
    }
  }

  void menuAnimationCompleted() {
    if (widget.menuAnimationController.status == AnimationStatus.completed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
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
            color: appTheme.darkThree.withAlpha((min(animateValue * 5, 255)).toInt())
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'appLogo',
                  child: AppLogo(onTap: widget.onClickLogo),
                ),
                const Spacer(),
                ...widget.items.map((e) {
                  return AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _animations[widget.items.indexOf(e)].value,
                        child: Transform.translate(
                          offset: Offset(0, -20 * (1 - _animations[widget.items.indexOf(e)].value)),
                          child: child,
                        ),
                      );
                    },
                    child: e,
                  );
                }).toList(),
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