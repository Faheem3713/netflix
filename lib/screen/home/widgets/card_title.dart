import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix/functions/apiservices.dart';
import 'package:netflix/functions/trendingRepo.dart';

import '../../../constants/textstyles.dart';

class MainCardTitle extends StatelessWidget {
  const MainCardTitle(
      {super.key,
      required this.text,
      required this.image,
      required this.length});
  final String text;
  final List<String> image;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: CustomTextStyles.mainTitleStyle,
        ),
        SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Card(
                child: Image.network(image[index]),
              ),
              itemCount: length,
            )),
      ],
    );
  }
}
