import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/usecases/base_usecase.dart';
import 'package:news_app/core/utils/enum.dart';
import 'package:news_app/feature/News/domain/entities/news.dart';
import 'package:news_app/feature/News/domain/usecase/get_sports_usecase.dart';

part 'sports_event.dart';
part 'sports_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  final GetSportsUseCase getSportsUseCase;
  SportsBloc(this.getSportsUseCase) : super(const SportsState()) {
    on<GetSportsEvent>(_getSport);
  }

  FutureOr<void> _getSport(
      GetSportsEvent event, Emitter<SportsState> emit) async {
    final result = await getSportsUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            sportsState: RequestState.error, sportsMessage: l.message)),
        (r) => emit(
            state.copyWith(sportsState: RequestState.success, getSports: r)));
  }
}
