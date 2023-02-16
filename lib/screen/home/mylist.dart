import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/constants/colors.dart';
import 'package:netflix/constants/textstyles.dart';
import 'package:netflix/functions/trendingRepo.dart';
import 'package:netflix/model/trending.dart';
import 'package:netflix/screen/downloads/downloads.dart';

class MyListWidget extends StatelessWidget {
  const MyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TrendingRepo.instance.createList();
        },
        child: Icon(Icons.add),
      ),
      appBar: const PreferredSize(
        child: AppBarWidget(text: 'MyList'),
        preferredSize: Size.fromHeight(50),
      ),
      body: ValueListenableBuilder(
          valueListenable: TrendingRepo.instance.myListNotifier,
          builder: (context, myList, _) {
            return ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Color.fromRGBO(0, 0, 0, 0),
                child: ListTile(
                  title: Text(
                    myList[index].name,
                    style: CustomTextStyles.appBarTitleStyle,
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        TrendingRepo.instance.deleteList(myList[index].id);
                      },
                      icon: Icon(
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
