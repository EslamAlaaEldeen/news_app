part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<News> search;
  final RequestState searchState;
  final String searchMessage;

  const SearchState({
    this.search = const [],
    this.searchState = RequestState.loading,
    this.searchMessage = '',
  });

  SearchState copyWith(
      {List<News>? search, RequestState? searchState, String? searchMessage}) {
    return SearchState(
        search: search ?? this.search,
        searchState: searchState ?? this.searchState,
        searchMessage: searchMessage ?? this.searchMessage);
  }

  @override
  List<Object> get props => [search, searchState, searchMessage];
}
