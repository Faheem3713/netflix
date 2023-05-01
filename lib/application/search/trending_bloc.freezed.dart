// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrendingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String searchQuery) searchData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String searchQuery)? searchData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchQuery)? searchData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(SearchDataEvent value) searchData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(SearchDataEvent value)? searchData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(SearchDataEvent value)? searchData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingEventCopyWith<$Res> {
  factory $TrendingEventCopyWith(
          TrendingEvent value, $Res Function(TrendingEvent) then) =
      _$TrendingEventCopyWithImpl<$Res, TrendingEvent>;
}

/// @nodoc
class _$TrendingEventCopyWithImpl<$Res, $Val extends TrendingEvent>
    implements $TrendingEventCopyWith<$Res> {
  _$TrendingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedCopyWith<$Res> {
  factory _$$StartedCopyWith(_$Started value, $Res Function(_$Started) then) =
      __$$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedCopyWithImpl<$Res>
    extends _$TrendingEventCopyWithImpl<$Res, _$Started>
    implements _$$StartedCopyWith<$Res> {
  __$$StartedCopyWithImpl(_$Started _value, $Res Function(_$Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Started implements Started {
  const _$Started();

  @override
  String toString() {
    return 'TrendingEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String searchQuery) searchData,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String searchQuery)? searchData,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchQuery)? searchData,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(SearchDataEvent value) searchData,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(SearchDataEvent value)? searchData,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(SearchDataEvent value)? searchData,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements TrendingEvent {
  const factory Started() = _$Started;
}

/// @nodoc
abstract class _$$SearchDataEventCopyWith<$Res> {
  factory _$$SearchDataEventCopyWith(
          _$SearchDataEvent value, $Res Function(_$SearchDataEvent) then) =
      __$$SearchDataEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchQuery});
}

/// @nodoc
class __$$SearchDataEventCopyWithImpl<$Res>
    extends _$TrendingEventCopyWithImpl<$Res, _$SearchDataEvent>
    implements _$$SearchDataEventCopyWith<$Res> {
  __$$SearchDataEventCopyWithImpl(
      _$SearchDataEvent _value, $Res Function(_$SearchDataEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
  }) {
    return _then(_$SearchDataEvent(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchDataEvent implements SearchDataEvent {
  _$SearchDataEvent({required this.searchQuery});

  @override
  final String searchQuery;

  @override
  String toString() {
    return 'TrendingEvent.searchData(searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDataEvent &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDataEventCopyWith<_$SearchDataEvent> get copyWith =>
      __$$SearchDataEventCopyWithImpl<_$SearchDataEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String searchQuery) searchData,
  }) {
    return searchData(searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String searchQuery)? searchData,
  }) {
    return searchData?.call(searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchQuery)? searchData,
    required TResult orElse(),
  }) {
    if (searchData != null) {
      return searchData(searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(SearchDataEvent value) searchData,
  }) {
    return searchData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(SearchDataEvent value)? searchData,
  }) {
    return searchData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(SearchDataEvent value)? searchData,
    required TResult orElse(),
  }) {
    if (searchData != null) {
      return searchData(this);
    }
    return orElse();
  }
}

abstract class SearchDataEvent implements TrendingEvent {
  factory SearchDataEvent({required final String searchQuery}) =
      _$SearchDataEvent;

  String get searchQuery;
  @JsonKey(ignore: true)
  _$$SearchDataEventCopyWith<_$SearchDataEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TrendingState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailures, List<Trending>>> get trendingData =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailures, List<SearchModel>>> get SearchData =>
      throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrendingStateCopyWith<TrendingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingStateCopyWith<$Res> {
  factory $TrendingStateCopyWith(
          TrendingState value, $Res Function(TrendingState) then) =
      _$TrendingStateCopyWithImpl<$Res, TrendingState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailures, List<Trending>>> trendingData,
      Option<Either<MainFailures, List<SearchModel>>> SearchData,
      bool isError});
}

/// @nodoc
class _$TrendingStateCopyWithImpl<$Res, $Val extends TrendingState>
    implements $TrendingStateCopyWith<$Res> {
  _$TrendingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? trendingData = null,
    Object? SearchData = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trendingData: null == trendingData
          ? _value.trendingData
          : trendingData // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, List<Trending>>>,
      SearchData: null == SearchData
          ? _value.SearchData
          : SearchData // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, List<SearchModel>>>,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_trendingStateCopyWith<$Res>
    implements $TrendingStateCopyWith<$Res> {
  factory _$$_trendingStateCopyWith(
          _$_trendingState value, $Res Function(_$_trendingState) then) =
      __$$_trendingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailures, List<Trending>>> trendingData,
      Option<Either<MainFailures, List<SearchModel>>> SearchData,
      bool isError});
}

/// @nodoc
class __$$_trendingStateCopyWithImpl<$Res>
    extends _$TrendingStateCopyWithImpl<$Res, _$_trendingState>
    implements _$$_trendingStateCopyWith<$Res> {
  __$$_trendingStateCopyWithImpl(
      _$_trendingState _value, $Res Function(_$_trendingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? trendingData = null,
    Object? SearchData = null,
    Object? isError = null,
  }) {
    return _then(_$_trendingState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trendingData: null == trendingData
          ? _value.trendingData
          : trendingData // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, List<Trending>>>,
      SearchData: null == SearchData
          ? _value.SearchData
          : SearchData // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, List<SearchModel>>>,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_trendingState implements _trendingState {
  const _$_trendingState(
      {required this.isLoading,
      required this.trendingData,
      required this.SearchData,
      required this.isError});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailures, List<Trending>>> trendingData;
  @override
  final Option<Either<MainFailures, List<SearchModel>>> SearchData;
  @override
  final bool isError;

  @override
  String toString() {
    return 'TrendingState(isLoading: $isLoading, trendingData: $trendingData, SearchData: $SearchData, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_trendingState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.trendingData, trendingData) ||
                other.trendingData == trendingData) &&
            (identical(other.SearchData, SearchData) ||
                other.SearchData == SearchData) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, trendingData, SearchData, isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_trendingStateCopyWith<_$_trendingState> get copyWith =>
      __$$_trendingStateCopyWithImpl<_$_trendingState>(this, _$identity);
}

abstract class _trendingState implements TrendingState {
  const factory _trendingState(
      {required final bool isLoading,
      required final Option<Either<MainFailures, List<Trending>>> trendingData,
      required final Option<Either<MainFailures, List<SearchModel>>> SearchData,
      required final bool isError}) = _$_trendingState;

  @override
  bool get isLoading;
  @override
  Option<Either<MainFailures, List<Trending>>> get trendingData;
  @override
  Option<Either<MainFailures, List<SearchModel>>> get SearchData;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_trendingStateCopyWith<_$_trendingState> get copyWith =>
      throw _privateConstructorUsedError;
}
