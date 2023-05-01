import 'package:flutter/material.dart';

import 'package:netflix/services/trendingRepo.dart';
import 'package:netflix/screen/common/widgets/icon_text.dart';
import 'package:netflix/screen/home/mylist.dart';
import 'package:netflix/screen/home/widgets/number_card.dart';

import '../../domain/core/constants/colors.dart';
import '../../domain/core/constants/textstyles.dart';
import '../../services/apiservices.dart';
import 'widgets/card_title.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  TrendingRepo.instance.popularNotifier.value.isEmpty
                      ? SizedBox()
                      : Container(
                          height: MediaQuery.of(context).size.height * .8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(ApiEndPoints.imageApi +
                                      TrendingRepo.instance.popularNotifier
                                          .value[0].posterPath))),
                        ),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconText(
                          icon: Icons.add,
                          text: 'My list',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyListWidget(),
                                ));
                          },
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.white,
                          ),
                          label: const Text(
                            'Play',
                            style: TextStyle(color: CustomColors.black),
                          ),
                          icon: const Icon(
                            Icons.play_arrow,
                            color: CustomColors.black,
                          ),
                          onPressed: () {},
                        ),
                        IconText(
                          icon: Icons.info_outline,
                          text: 'Info',
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
              ValueListenableBuilder(
                  valueListenable: TrendingRepo.instance.trendingNotifier,
                  builder: (context, trending, _) {
                    return MainCardTitle(
                        text: 'Popular on Netflix', image: trending, length: 6);
                  }),
              ValueListenableBuilder(
                  valueListenable: TrendingRepo.instance.popularNotifier,
                  builder: (context, popularMovies, _) {
                    return MainCardTitle(
                        text: 'Trending Now',
                        image: TrendingRepo
                            .instance.trendingNotifier.value.reversed
                            .toList(),
                        length: 6);
                  }),
              ValueListenableBuilder(
                  valueListenable: TrendingRepo.instance.topRatedNotifier,
                  builder: (context, topMovies, _) {
                    return MainCardTitle(
                        text: 'Watch it again', image: topMovies, length: 6);
                  }),
              const NumberCard()
            ],
          ),
          customAppBar()
        ],
      ),
    );
  }

  Widget customAppBar() {
    return SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/image-removebg-preview.png',
              height: 45,
            ),
            const Text("TvShows", style: CustomTextStyles.appBarTitleStyle),
            const Text("Movies", style: CustomTextStyles.appBarTitleStyle),
            const Text("MyList", style: CustomTextStyles.appBarTitleStyle)
          ],
        ));
  }
}
