import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/services/apiservices.dart';
import 'package:netflix/services/trendingRepo.dart';

import '../../model/search_model.dart';
import '../../model/trending.dart';

part 'trending_event.dart';
part 'trending_state.dart';
part 'trending_bloc.freezed.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(TrendingState.initial()) {
    on<Started>((event, emit) async {
      emit(TrendingState(
          isLoading: true,
          trendingData: none(),
          isError: false,
          SearchData: none()));
      final val = await TrendingRepo.instance.getPopular();
      emit(val.fold(
          (MainFailures f) => TrendingState(
              SearchData: none(),
              isLoading: false,
              trendingData: some(left(f)),
              isError: false),
          (r) => TrendingState(
              SearchData: none(),
              isLoading: false,
              trendingData: some(right(r)),
              isError: false)));
    });
    on<SearchDataEvent>((event, emit) async {
      emit(TrendingState(
          isLoading: true,
          trendingData: none(),
          isError: false,
          SearchData: none()));
      final val = await TrendingRepo.instance.searchMovies(event.searchQuery);
      emit(val.fold(
          (MainFailures f) => TrendingState(
              SearchData: some(left(f)),
              isLoading: false,
              trendingData: none(),
              isError: false),
          (r) => TrendingState(
              SearchData: some(right(r)),
              isLoading: false,
              trendingData: none(),
              isError: false)));
    });
  }
}
