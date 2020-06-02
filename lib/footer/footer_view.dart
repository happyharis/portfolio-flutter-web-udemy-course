import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/constants.dart';
import 'package:portfolio_flutter_web/utils/hover_extensions.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      desktopView: FooterDesktopView(),
      mobileView: FooterMobileView(),
    );
  }
}

class FooterDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
      height: 100,
      width: kInitWidth,
      padding: kScreenPadding,
      child: Row(
        children: [
          Text('© <insert your name> $currentYear -- '),
          InkWell(
            child: Text(
              'See the source code',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            mouseCursor: MaterialStateMouseCursor.clickable,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => launch('https://github.com'),
          ),
          Spacer(),
          for (final social in socials)
            IconButton(
              icon: social.icon,
              onPressed: () => launch(social.url),
              color: Colors.redAccent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ).moveUpOnHover,
          SizedBox(width: 60),
        ],
      ),
    );
  }
}

class FooterMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return Container(
      padding: kScreenPadding,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final social in socials)
                IconButton(
                  icon: social.icon,
                  onPressed: () => launch(social.url),
                  color: Colors.redAccent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )
            ],
          ),
          SizedBox(height: 20),
          Text('© <insert your name> $currentYear'),
          SizedBox(height: 20),
          InkWell(
            child: Text(
              'See the source code',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            mouseCursor: MaterialStateMouseCursor.clickable,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => launch('https://github.com'),
          ),
        ],
      ),
    );
  }
}

class SocialInfo {
  final Widget icon;
  final String url;
  SocialInfo({
    @required this.icon,
    @required this.url,
  });
}

final socials = [
  SocialInfo(
    icon: FaIcon(FontAwesomeIcons.facebook),
    url: 'https://www.facebook.com',
  ),
  SocialInfo(
    icon: FaIcon(FontAwesomeIcons.instagram),
    url: 'https://www.instagram.com',
  ),
  SocialInfo(
    icon: FaIcon(FontAwesomeIcons.linkedin),
    url: 'https://www.linkedin.com',
  ),
  SocialInfo(
    icon: FaIcon(FontAwesomeIcons.twitter),
    url: 'https://www.twitter.com',
  ),
];
