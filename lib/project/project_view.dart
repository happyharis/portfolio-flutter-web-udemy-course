import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:portfolio_flutter_web/constants.dart';

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
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (size.isMobile) return ProjectMobileView();
        return ProjectDesktopView();
      },
    );
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 864,
      width: kInitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Projects', style: Theme.of(context).textTheme.headline2),
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
          )
        ],
      ),
    );
  }
}

class ProjectItemBody extends StatelessWidget {
  const ProjectItemBody({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(item.image),
        SizedBox(height: 15),
        Text(
          item.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 10),
        Text(item.description, style: TextStyle(fontSize: 17)),
        SizedBox(height: 10),
        Row(
          children: [
            for (final tech in item.technologies)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(label: Text(tech)),
              )
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: kInitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 3),
          SizedBox(height: 40),
          Text('Projects', style: Theme.of(context).textTheme.headline2),
          SizedBox(height: 40),
          for (final item in kProjectItems) ProjectItemBody(item: item)
        ],
      ),
    );
  }
}
