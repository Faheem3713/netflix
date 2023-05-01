part of 'trending_bloc.dart';

@freezed
class TrendingState with _$TrendingState {
  const factory TrendingState(
      {required bool isLoading,
      required Option<Either<MainFailures, List<Trending>>> trendingData,
      required Option<Either<MainFailures, List<SearchModel>>> SearchData,
      required bool isError}) = _trendingState;
  factory TrendingState.initial() {
    return TrendingState(
        isLoading: false,
        trendingData: none(),
        isError: false,
        SearchData: none());
  }
}
