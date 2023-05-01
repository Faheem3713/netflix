import 'package:flutter/material.dart';
import 'package:netflix/services/apiservices.dart';
import 'package:netflix/services/trendingRepo.dart';
import '../../../domain/core/constants/textstyles.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: TrendingRepo.instance.popularNotifier,
        builder: (context, numberCard, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Top 10 TV Shows in India',
                style: CustomTextStyles.mainTitleStyle,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Image.network(ApiEndPoints.imageApi +
                            numberCard[index].posterPath),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                fontSize: 90,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.white,
                              ),
                            ),
                            // Solid text as fill.
                            Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                fontSize: 90,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  itemCount: 6,
                ),
              ),
            ],
          );
        });
  }
}
