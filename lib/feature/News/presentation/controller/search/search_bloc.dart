import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/parameters/search_parameter.dart';
import 'package:news_app/core/utils/enum.dart';
import 'package:news_app/feature/News/domain/entities/news.dart';
import 'package:news_app/feature/News/domain/usecase/get_search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchUseCase getSearchUseCase;

  SearchBloc(this.getSearchUseCase) : super(const SearchState()) {
    on<GetSearchEvent>(_getSearch);
  }

  FutureOr<void> _getSearch(
      GetSearchEvent event, Emitter<SearchState> emit) async {
    if (event.value.isEmpty) {
      emit(state.copyWith(search: [], searchState: RequestState.success));
      return;
    }
    final result = await getSearchUseCase(SearchParameter(value: event.value));
    result.fold((l) {
      emit(state.copyWith(
          searchState: RequestState.error, searchMessage: l.message));
    }, (r) {
      emit(state.copyWith(searchState: RequestState.success, search: r));
    });
  }
}
