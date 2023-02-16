import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/textstyles.dart';
import 'package:netflix/functions/apiservices.dart';
import 'package:netflix/functions/trendingRepo.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  String valCheck = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoSearchTextField(
            style: TextStyle(color: Colors.white),
            placeholderStyle: TextStyle(color: Colors.white),
            controller: _searchController,
            suffixMode: OverlayVisibilityMode.always,
            onChanged: (value) async {
              setState(() {
                valCheck = value;
              });
              await TrendingRepo.instance.searchMovies(value);
            },
          ),
        ),
      ),
      body: valCheck.isEmpty ? SearchSuggestions() : SearchedList(),
    );
  }
}

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Movies & TV",
            style: CustomTextStyles.mainHeaderStyle,
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: TrendingRepo.instance.trendingNotifier,
                builder: (context, trending, _) {
                  return GridView.builder(
                    itemCount: 20,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.5,
                            crossAxisSpacing: 8,
                            crossAxisCount: 3,
                            mainAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Image.network(
                        trending[index],
                        fit: BoxFit.cover,
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SearchedList extends StatelessWidget {
  const SearchedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Top Searches",
          style: CustomTextStyles.appBarTitleStyle,
        ),
        Expanded(
            child: ValueListenableBuilder(
                valueListenable: TrendingRepo.instance.searchNotifier,
                builder: (context, searchitems, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchitems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.transparent,
                        child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              ApiServices.imageApi +
                                  searchitems[index].posterPath,
                              height: 80,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  searchitems[index].title,
                                  style: CustomTextStyles.appBarTitleStyle,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                              size: 35,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                })),
      ],
    );
  }
}
