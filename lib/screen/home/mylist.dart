import 'package:flutter/material.dart';
import 'package:netflix/services/trendingRepo.dart';
import 'package:netflix/screen/downloads/downloads.dart';

import '../../domain/core/constants/colors.dart';
import '../../domain/core/constants/textstyles.dart';

class MyListWidget extends StatelessWidget {
  const MyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TrendingRepo.instance.createList();
        },
        child: const Icon(Icons.add),
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(text: 'MyList'),
      ),
      body: ValueListenableBuilder(
          valueListenable: TrendingRepo.instance.myListNotifier,
          builder: (context, myList, _) {
            return ListView.builder(
              itemBuilder: (context, index) => Card(
                color: const Color.fromRGBO(0, 0, 0, 0),
                child: ListTile(
                  enabled: true,
                  title: Text(
                    myList[index].name,
                    style: CustomTextStyles.appBarTitleStyle,
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        TrendingRepo.instance.deleteList(myList[index].id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: CustomColors.white,
                      )),
                ),
              ),
              itemCount: myList.length,
            );
          }),
    );
  }
}
