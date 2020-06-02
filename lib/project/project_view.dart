import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_view_builder.dart';
import 'package:portfolio_flutter_web/project/project_item_body.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;
  ProjectItem({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
    image: 'images/project_1.png',
    title: 'Fun-niture App',
    description:
        'Fun-niture App provides a variety of furniture for your Living Room, Bed Room, Dining Room, and Kitchen. We provide a range of products from Sofa sets to recliners which are inspired by modern designs.',
    technologies: [
      'Flutter',
      'Firebase',
    ],
  ),
  ProjectItem(
    image: 'images/project_2.png',
    title: 'Neumorphic Design App',
    description:
        'Neumorphic design that is a simple desing showcase app designed with Neumorphism in mind.',
    technologies: [
      'Flutter',
      'Firebase',
    ],
  ),
  ProjectItem(
    image: 'images/project_3.png',
    title: 'Period Tracker App',
    description:
        'An intelligent period tracker app that makes sense of what you track! Pslove Period Tracker not only accurately predicts your upcoming menstrual cycles & fertile days, but also analyses trends in your body. It’s easy to get on top of your health!',
    technologies: [
      'Flutter',
      'Firebase',
    ],
  ),
];

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key key,
  }) : super(key: key);
  static const title = 'Projects';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: ProjectMobileView(), desktopView: ProjectDesktopView());
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectView.title,
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in kProjectItems)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProjectItemBody(item: item),
                ),
              )
          ],
        ),
        SizedBox(height: 70),
      ],
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.title,
      children: [for (final item in kProjectItems) ProjectItemBody(item: item)],
    );
  }
}
