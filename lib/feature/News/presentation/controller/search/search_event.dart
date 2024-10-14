part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class GetSearchEvent extends SearchEvent {
  final String value;

  const GetSearchEvent(this.value);

  @override
  List<Object> get props => [value];
}
