import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({
    Key key,
    @required this.experience,
    @required this.index,
  }) : super(key: key);

  final ExperienceInfo experience;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = ColourAssets.all;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: colors.elementAt(index % colors.length),
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.company,
            style: textStyle(isBold: true),
          ),
          SizedBox(height: 10),
          Text(
            experience.timeline,
            style: textStyle(isGrey: true),
          ),
          SizedBox(height: 10),
          for (final item in experience.descriptions)
            Text(
              item,
              style: textStyle(),
            )
        ],
      ),
    );
  }
}

TextStyle textStyle({bool isBold, bool isGrey}) {
  return TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
    color: isGrey ?? false ? Colors.grey : Colors.black,
  );
}

class ExperienceInfo {
  final String company;
  final String timeline;
  final List<String> descriptions;
  ExperienceInfo({
    @required this.company,
    @required this.timeline,
    @required this.descriptions,
  });
}

final experiences = [
  ExperienceInfo(
    company: 'Software Developer @ PSLOVE (Start Up)',
    timeline: 'June 2018 - September 2019 (16 months)',
    descriptions: [
      '- Created the period tracker app with Flutter from inception to 30,000 downloads',
      '- Maintained backend services using Firebase in TypeScript',
      '- Worked in a team of 3 developers',
    ],
  ),
  ExperienceInfo(
    company: 'Intern @ TinkerTanker (Education Tech)',
    timeline: 'January 2018 - May 2018 (5 months)',
    descriptions: [
      '- Taught over 300 students in over 5 schools',
      '- Taught Game Development in Unity/C#, assisted in Data Science Course in Python',
      '- Assisted in developing Blockchain curriculum in Javascript',
    ],
  ),
  ExperienceInfo(
    company: 'Full Stack Web Developement Coding Bootcamp @ AlphaCamp',
    timeline: 'August 2017 - October 2017 (3 months)',
    descriptions: [
      '- Built 5 projects in Ruby in Rails such as Twitter clone, Food Review website',
      '- Learnt HTML, CSS, Ruby, Ruby on Rails, JQuery, Javascript ',
      '- Led a team of 3 developers in final project',
    ],
  ),
  ExperienceInfo(
    company: 'Coding Instructor Volunteer @ Code in the Community',
    timeline: 'April 2018 - January 2020 (21 months)',
    descriptions: [
      '- Taught over 30 students in Python and Scratch programming',
      '- Mentored over 10 volunteers in teaching and coaching young students',
      '- Featured on local news on volunteering experience',
    ],
  ),
];
