import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/theme.dart';
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