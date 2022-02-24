import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/theme.dart';
import '../commons.dart';
import '../typography.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isHover = false;



  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return InkWell(
      onTap: widget.onPressed,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      borderRadius: BorderRadius.circular(4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isHover ? appTheme.primary.withAlpha(60) : appTheme.primary.withAlpha(20),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: appTheme.primary
          )
        ),
        child: SubTitle2(widget.text, color: appTheme.primary),
      ),
    );
  }
}


class MenuButton extends StatefulWidget {
  final String prefixText;
  final String text;
  final VoidCallback onTap;
  const MenuButton({
    Key? key,
    required this.prefixText,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return GestureDetector(
      onTap: widget.onTap,
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
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SubTitle1(widget.prefixText, color: appTheme.primary),
              horizontalSpace(),
              SubTitle1(widget.text, color: isHover ? appTheme.primary : appTheme.lightThree),
            ],
          ),
        ),
      ),
    );
  }
}

class IconsButton extends StatefulWidget {
  final IconData? icon;
  final String? text;
  final VoidCallback onTap;
  const IconsButton({
    Key? key,
    this.icon,
    this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<IconsButton> createState() => _IconsButtonState();
}

class _IconsButtonState extends State<IconsButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return GestureDetector(
      onTap: widget.onTap,
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
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.only(bottom: isHover ? 2 : 0, top: isHover ? 0 : 2),
            child: widget.text == null ? Icon(
              widget.icon,
              size: 28,
              color: isHover ? appTheme.primary : appTheme.lightThree,
            ) : RotatedBox(
              quarterTurns: 1,
              child: SubTitle2(widget.text!, color: isHover ? appTheme.primary : appTheme.lightThree),
            ),
          )
        ),
      ),
    );
  }
}

class ClickableText extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const ClickableText({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ClickableText> createState() => _ClickableTextState();
}

class _ClickableTextState extends State<ClickableText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return MouseRegion(
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
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Caption(widget.text, fontSize: 14, color: isHover ? appTheme.primary : appTheme.lightTwo),
      ),
    );
  }
}