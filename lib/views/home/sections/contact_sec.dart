import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishangavidusha/utils/widgets/buttons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/theme.dart';
import '../../../utils/commons.dart';
import '../../../utils/typography.dart';

class ContactSec extends StatefulWidget {
  const ContactSec({
    Key? key,
  }) : super(key: key);

  @override
  _ContactSecState createState() => _ContactSecState();
}

class _ContactSecState extends State<ContactSec> {
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 84),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SubTitle1("04. What’s Next?", color: appTheme.primary),
            verticalSpace(),
            HeadLine3("Get In Touch", color: appTheme.lightThree, textStyle: const TextStyle(fontWeight: FontWeight.bold)),
            verticalSpace(value: 20),
            SizedBox(
              width: 450,
              child: SubTitle1(
                "Although I’m not currently looking for any new opportunities, my inbox is always open. Whether you have a question, request or just want to say hi, I’ll try my best to get back to you!",
                color: appTheme.lightTwo,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(value: 30),
            AppButton(
              text: "Say Hello",
              onPressed: () {
                launch("mailto:contact@ishangavidusha.com");
              },
            ),
            verticalSpace(value: 30),
            if (devWidth(context) < ScreenSize.desktop.maxWidth()) Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconsButton(
                  icon: FontAwesomeIcons.github,
                  onTap: () {
                    launch("https://github.com/ishangavidusha");
                  },
                ),
                IconsButton(
                  icon: FontAwesomeIcons.instagram,
                  onTap: () {
                    launch("https://www.instagram.com/ishanga_vidusha");
                  },
                ),
                IconsButton(
                  icon: FontAwesomeIcons.twitter,
                  onTap: () {
                    launch("https://twitter.com/ishangavidusha");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}