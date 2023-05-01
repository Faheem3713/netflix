import 'package:flutter/material.dart';
import 'package:netflix/screen/downloads/downloads.dart';
import 'package:netflix/screen/new&hot/widgets/every_one_watching.dart';

import '../../domain/core/constants/colors.dart';
import 'widgets/movie_card_details.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              text: 'New & Hot',
            )),
        body: Column(
          children: [
            TabBar(
                unselectedLabelColor: CustomColors.white,
                labelColor: CustomColors.black,
                indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                tabs: const [
                  Tab(
                    child: Text('🍿Coming Soon'),
                  ),
                  Tab(
                    child: Text("👀Everyone's watching"),
                  )
                ]),
            Expanded(
                child: TabBarView(
                    children: [comingSoonPage(), everyoneWatchingPage()]))
          ],
        ),
      ),
    );
  }
}

Widget comingSoonPage() {
  return ListView.separated(
    padding: const EdgeInsets.all(5),
    itemBuilder: (context, index) {
      return MovieDetailedCard(
        index: index,
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      height: 20,
    ),
    itemCount: 5,
  );
}

Widget everyoneWatchingPage() {
  return EveryOneWatchingCard();
}
