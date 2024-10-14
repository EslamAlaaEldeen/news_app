import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/usecases/base_usecase.dart';
import 'package:news_app/core/utils/enum.dart';
import 'package:news_app/feature/News/domain/entities/news.dart';
import 'package:news_app/feature/News/domain/usecase/get_science_usecase.dart';

part 'science_event.dart';
part 'science_state.dart';

class ScienceBloc extends Bloc<ScienceEvent, ScienceState> {
  final GetScienceUseCase getScienceUseCase;
  ScienceBloc(this.getScienceUseCase) : super(const ScienceState()) {
    on<GetScienceEvent>(_getScience);
  }

  FutureOr<void> _getScience(
      GetScienceEvent event, Emitter<ScienceState> emit) async {
    final result = await getScienceUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            scienceState: RequestState.error, scienceMessage: l.message)),
        (r) => emit(
            state.copyWith(scienceState: RequestState.success, getScience: r)));
  }
}
