import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/textstyles.dart';

import '../common/widgets/icon_text.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(
          10,
          (index) => Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                color: Colors.green,
                // decoration: const BoxDecoration(
                //     image: DecorationImage(
                //         fit: BoxFit.contain,
                //         image: AssetImage('assets/images/avatar.png'))),
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'this is page $index',
                          style: CustomTextStyles.mainHeaderStyle,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black87,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.volume_off_rounded)),
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avengers.jpg'),
                            ),
                            IconText(
                              icon: Icons.emoji_emotions,
                              text: 'LOL',
                              onPressed: () {},
                            ),
                            IconText(
                                icon: Icons.add,
                                text: 'My List',
                                onPressed: () {}),
                            IconText(
                                icon: Icons.share,
                                text: 'Share',
                                onPressed: () {}),
                            IconText(
                                icon: Icons.play_arrow,
                                text: 'Play',
                                onPressed: () {})
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
