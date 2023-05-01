import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/services/apiservices.dart';
import 'package:netflix/services/trendingRepo.dart';

import '../../../domain/core/constants/colors.dart';
import '../../../domain/core/constants/size.dart';
import '../../../domain/core/constants/textstyles.dart';
import '../../common/widgets/icon_text.dart';

class MovieDetailedCard extends StatelessWidget {
  const MovieDetailedCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: TrendingRepo.instance.popularNotifier,
        builder: (context, popular, _) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text(
                    'FEB',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                  ),
                  Text('11',
                      style: CustomTextStyles.mainHeaderStyle
                          .copyWith(height: 0, fontSize: 22))
                ],
              ),
              CustomSize.width10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(ApiEndPoints.imageApi +
                              popular[index].posterPath),
                        ),
                      ),
                    ),
                    CustomSize.height10,
                    CustomSize.height10,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            popular[index].title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                letterSpacing: -2,
                                fontWeight: FontWeight.w200,
                                fontSize: 25),
                          ),
                        ),
                        IconText(
                            icon: CupertinoIcons.bell,
                            text: 'Remind me',
                            onPressed: () {}),
                        CustomSize.width10,
                        IconText(
                            icon: Icons.info_outline,
                            text: 'Info',
                            onPressed: () {})
                      ],
                    ),
                    Text('Coming on friday',
                        style: CustomTextStyles.mainTitleStyle.copyWith(
                          color: CustomColors.white,
                        )),
                    Text(
                      popular[index].title,
                      style: CustomTextStyles.mainTitleStyle.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      popular[index].overview,
                      style: TextStyle(color: Colors.white60),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
