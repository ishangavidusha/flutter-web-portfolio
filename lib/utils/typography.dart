import 'package:flutter/material.dart';
import 'commons.dart';

class HeadLine1 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const HeadLine1(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 72,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline1?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class HeadLine2 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const HeadLine2(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 60,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline2?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class HeadLine3 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const HeadLine3(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 48,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline3?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class HeadLine4 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const HeadLine4(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 34,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline4?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class HeadLine5 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const HeadLine5(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 24,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline5?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class HeadLine6 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const HeadLine6(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 20,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline6?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class SubTitle1 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const SubTitle1(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 16,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.subtitle1?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class SubTitle2 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const SubTitle2(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 14,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.subtitle2?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class Body1 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const Body1(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 16,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.bodyMedium?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class Body2 extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const Body2(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 14,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.bodyText2?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}

class Caption extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final double fontSize;
  final bool isResponsive;
  final int? maxLines;
  const Caption(
    this.data,{
    Key? key,
    this.textStyle = const TextStyle(),
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.fontSize = 12,
    this.isResponsive = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.caption?.merge(textStyle).copyWith(
        color: color,
        fontSize: isResponsive ? getTextSize(context, fontSize) : fontSize,
        shadows: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 6)
          ),
        ]
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}
