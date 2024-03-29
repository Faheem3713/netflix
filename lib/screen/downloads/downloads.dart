import 'package:flutter/material.dart';

import 'package:netflix/services/trendingRepo.dart';

import '../../domain/core/constants/colors.dart';
import '../../domain/core/constants/size.dart';
import '../../domain/core/constants/textstyles.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(text: 'Downloads')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            //    padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              CustomSize.width10,
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: CustomColors.white,
                    ),
                    label: const Text(
                      'Smart Downloads',
                      style: CustomTextStyles.appBarTitleStyle,
                    ),
                  ),
                ],
              ),
              Text(
                "Introducing Downloads for you",
                textAlign: TextAlign.center,
                style: CustomTextStyles.mainHeaderStyle,
              ),
              CustomSize.height10,
              const Text(
                "We'll download a personalized selection of\nmovies and shows for you,So there's\nalways some thing to watch on your\ndevice",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                ),
              ),
              CustomSize.height10,
              CustomSize.height10,
              Stack(
                children: [
                  const Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 120,
                    ),
                  ),
                  Positioned(
                    right: 15,
                    child: CardStacks(
                        size: 180,
                        transformRate: .2,
                        image: TrendingRepo.instance.trendingNotifier.value[1],
                        padding: const EdgeInsets.only(top: 25)),
                  ),

                  Positioned(
                    left: 15,
                    child: CardStacks(
                        size: 180,
                        transformRate: -.2,
                        image: TrendingRepo.instance.trendingNotifier.value[2],
                        padding: const EdgeInsets.only(top: 25)),
                  ),

                  Center(
                    child: CardStacks(
                        size: 210,
                        transformRate: 0,
                        image: TrendingRepo.instance.trendingNotifier.value[0],
                        padding: const EdgeInsets.only(top: 5)),
                  ),
                  // Positioned(
                  //   left: 0,
                  //   right: 0,
                  //   child: CardStacks(
                  //       size: 210,
                  //       transformRate: 0,
                  //       image: TrendingRepo.instance.trendingNotifier.value[0],
                  //       padding: const EdgeInsets.only(top: 20)),
                  // ),
                ],
              ),
              CustomSize.height10,
              CustomSize.height10,
              CustomSize.height10,
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 26, 68, 88)),
                    onPressed: () {},
                    child: const Text(
                      'Setup what you can Download',
                      style: CustomTextStyles.appBarTitleStyle,
                    )),
              ),
              CustomSize.height10,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(40),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'See what you can download',
                    style: CustomTextStyles.appBarTitleStyle
                        .copyWith(color: CustomColors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          CustomSize.width10,
          Text(
            text,
            style: CustomTextStyles.mainHeaderStyle,
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: CustomColors.white,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue,
            height: 25,
            width: 25,
          )
        ],
      ),
    );
  }
}

class CardStacks extends StatelessWidget {
  const CardStacks(
      {super.key,
      required this.transformRate,
      required this.image,
      required this.padding,
      required this.size});
  final double transformRate;
  final String image;
  final EdgeInsets padding;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: transformRate,
      child: Container(
        width: MediaQuery.of(context).size.width * .35,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                image,
              ),
            ),
            borderRadius: BorderRadius.circular(10)),
        height: size,
        margin: padding,
      ),
    );
  }
}
