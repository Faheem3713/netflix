import 'package:flutter/material.dart';
import 'package:netflix/constants/colors.dart';

class IconText extends StatelessWidget {
  const IconText(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});
  final IconData icon;
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(foregroundColor: CustomColors.white),
        onPressed: onPressed,
        child: Column(
          children: [
            Icon(
              shadows: const [Shadow(color: Colors.black, blurRadius: 20.0)],
              icon,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
