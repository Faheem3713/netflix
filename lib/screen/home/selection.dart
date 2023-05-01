import 'package:flutter/material.dart';

import 'package:netflix/notifiers/valuenotifiers.dart';
import 'package:netflix/screen/downloads/downloads.dart';
import 'package:netflix/screen/fastlaugh/fastlaugh.dart';
import 'package:netflix/screen/home/home.dart';
import 'package:netflix/screen/new&hot/newandhot.dart';
import 'package:netflix/screen/search/search.dart';

import '../../domain/core/constants/colors.dart';
import '../../services/trendingRepo.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});
  final List _pages = const [
    MyHomePage(),
    NewAndHot(),
    FastLaugh(),
    SearchPage(),
    Downloads()
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Notifiers.selectedIndexNotifiers,
        builder: (context, page, _) {
          return Scaffold(
            body: _pages[page],
            bottomNavigationBar: const BottomNavigationBarWidget(),
          );
        });
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Notifiers.selectedIndexNotifiers,
        builder: (context, value, _) {
          return BottomNavigationBar(
            unselectedIconTheme:
                IconThemeData(color: CustomColors.white.withOpacity(.4)),
            unselectedItemColor: CustomColors.white.withOpacity(.4),
            showUnselectedLabels: true,
            selectedIconTheme: const IconThemeData(color: CustomColors.white),
            selectedItemColor: CustomColors.white,
            backgroundColor: CustomColors.black,
            onTap: (value) {
              Notifiers.selectedIndexNotifiers.value = value;
            },
            currentIndex: value,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.browse_gallery), label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions_outlined),
                  label: 'Fast laugh'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Downloads'),
            ],
          );
        });
  }
}
