import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/utils/hover_extensions.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key key,
    this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'I\'m a Mobile',
          style: GoogleFonts.montserrat(fontSize: 60),
          maxLines: 1,
        ),
        AutoSizeText(
          'Developer < / >',
          style: GoogleFonts.montserrat(fontSize: 60),
          maxLines: 1,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 37),
        AutoSizeText(
          'I have 2 years of experience in mobile development in building beautiful apps in Android and iOS',
          style: TextStyle(fontSize: 24),
          maxLines: 3,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 40),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            backgroundColor: Colors.redAccent,
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ?? false ? 10 : 17,
              horizontal: isMobile ?? false ? 8 : 15,
            ),
            child: Text(
              'Contact Me',
              style: TextStyle(
                fontSize: isMobile ?? false ? 20 : 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
