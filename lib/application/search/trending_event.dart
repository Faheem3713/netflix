part of 'trending_bloc.dart';

@freezed
class TrendingEvent with _$TrendingEvent {
  const factory TrendingEvent.started() = Started;
  factory TrendingEvent.searchData({required String searchQuery}) =
      SearchDataEvent;
}
