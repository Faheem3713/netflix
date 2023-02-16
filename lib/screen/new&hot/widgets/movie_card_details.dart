import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';
import '../../../constants/textstyles.dart';
import '../../common/widgets/icon_text.dart';

class MovieDetailedCard extends StatelessWidget {
  const MovieDetailedCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Avatar',
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
                  ),
                  Spacer(),
                  IconText(
                      icon: CupertinoIcons.bell,
                      text: 'Remind me',
                      onPressed: () {}),
                  CustomSize.width10,
                  IconText(
                      icon: Icons.info_outline, text: 'Info', onPressed: () {})
                ],
              ),
              Text('Coming on friday',
                  style: CustomTextStyles.mainTitleStyle.copyWith(
                    color: CustomColors.white,
                  )),
              Text(
                'Tall Girl 2',
                style: CustomTextStyles.mainTitleStyle
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const Text(
                'Landing a job ina a faang company is the dream of every one who has a wish some thing ti be acheived this is something to be remembered',
                style: TextStyle(color: Colors.white60),
              )
            ],
          ),
        )
      ],
    );
  }
}
