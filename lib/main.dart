import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix/screen/start/onboarding.dart';
import 'package:netflix/services/trendingRepo.dart';

import 'application/search/trending_bloc.dart';

void main() {
  final obj1 = TrendingRepo.instance;
  final obj2 = TrendingRepo.instance;
  print(obj1 == obj2);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrendingBloc>(
          create: (context) => TrendingBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            iconTheme: const IconThemeData(color: Colors.white),
            textTheme: const TextTheme(
                //    bodyText1: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white)),
            scaffoldBackgroundColor: Colors.black,
            primarySwatch: Colors.blue,
          ),
          home: const OnBoarding()),
    );
  }
}
