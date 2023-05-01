import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';

import 'package:netflix/services/apiservices.dart';
import 'package:netflix/services/trendingRepo.dart';

import '../../application/search/trending_bloc.dart';
import '../../domain/core/constants/textstyles.dart';
import '../../model/search_model.dart';
import '../../model/trending.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

Timer? _debouncer;
run(VoidCallback action) {
  _debouncer?.cancel();
  _debouncer = Timer(const Duration(milliseconds: 500), action);
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  String valCheck = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              style: const TextStyle(color: Colors.white),
              placeholderStyle: const TextStyle(color: Colors.white),
              controller: _searchController,
              suffixMode: OverlayVisibilityMode.always,
              onChanged: (value) async {
                setState(() {
                  valCheck = value;
                });
                run(() => context
                    .read<TrendingBloc>()
                    .add(SearchDataEvent(searchQuery: value)));
              },
            ),
          ),
        ),
      ),
      body: valCheck.isEmpty ? const SearchSuggestions() : const SearchedList(),
    );
  }
}

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrendingBloc>().add(const TrendingEvent.started());
    });
    return BlocBuilder<TrendingBloc, TrendingState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return state.trendingData.fold(
              () => const Text('data'),
              (a) => a.fold(
                      (MainFailures l) => Text(l.when(
                            clientFailures: () => 'its client failure',
                            serverFailures: () => 'its server failure',
                          )), (List<Trending> r) {
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
                              child: GridView.builder(
                            itemCount: r.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 1.5,
                                    crossAxisSpacing: 8,
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 8),
                            itemBuilder: (context, index) {
                              return Image.network(
                                ApiEndPoints.imageApi + r[index].posterPath,
                                fit: BoxFit.cover,
                              );
                            },
                          ))
                        ],
                      ),
                    );
                  }));
        }
      },
    );
  }
}

class SearchedList extends StatelessWidget {
  const SearchedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state.SearchData.fold(
                () => const Text('data'),
                (a) => a.fold(
                        (l) => Text(l.when(
                            clientFailures: () => 'clientFailures',
                            serverFailures: () => 'serverFailures')),
                        (List<SearchModel> r) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Top Searches",
                            style: CustomTextStyles.appBarTitleStyle,
                          ),
                          Expanded(
                              child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: r.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.transparent,
                                child: Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    r[index].backdropPath == ""
                                        ? const SizedBox(
                                            height: 80,
                                            width: 150,
                                            child: Icon(
                                              Icons.image,
                                              size: 50,
                                            ),
                                          )
                                        : Image.network(
                                            ApiEndPoints.imageApi +
                                                r[index].posterPath,
                                            height: 80,
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          r[index].title,
                                          style:
                                              CustomTextStyles.appBarTitleStyle,
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
                          )),
                        ],
                      );
                    }));
      },
    );
  }
}
