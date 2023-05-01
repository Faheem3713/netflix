import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/services/apiservices.dart';
import 'package:netflix/services/trendingRepo.dart';
import 'package:netflix/screen/common/widgets/icon_text.dart';

import '../../../domain/core/constants/size.dart';
import '../../../domain/core/constants/textstyles.dart';

class EveryOneWatchingCard extends StatelessWidget {
  const EveryOneWatchingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: TrendingRepo.instance.popularNotifier,
        builder: (context, popular, _) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final _data = popular.reversed.toList()[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _data.title,
                      style: CustomTextStyles.appBarTitleStyle,
                    ),
                  ),
                  CustomSize.height20,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _data.overview,
                      style: TextStyle(fontSize: 12, color: Colors.white60),
                    ),
                  ),
                  CustomSize.height20,
                  Image.network(
                    ApiEndPoints.imageApi + _data.posterPath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * .4,
                  ),
                  CustomSize.height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconText(
                          icon: Icons.share, text: 'Share', onPressed: (() {})),
                      IconText(
                          icon: Icons.add, text: 'My List', onPressed: (() {})),
                      IconText(
                          icon: Icons.play_arrow,
                          text: 'Play',
                          onPressed: (() {}))
                    ],
                  ),
                  CustomSize.height20
                ],
              );
            },
            itemCount: 6,
          );
        });
  }
}
