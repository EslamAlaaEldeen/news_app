import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/usecases/base_usecase.dart';
import 'package:news_app/core/utils/enum.dart';
import 'package:news_app/feature/News/domain/entities/news.dart';
import 'package:news_app/feature/News/domain/usecase/get_business_usecase.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final GetBusinessUseCase getBusinessUseCase;
  BusinessBloc(this.getBusinessUseCase) : super(const BusinessState()) {
    on<GetBusinessEvent>(_getBusiness);
  }

  FutureOr<void> _getBusiness(
      GetBusinessEvent event, Emitter<BusinessState> emit) async {
    final result = await getBusinessUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            businessState: RequestState.error, businessMessage: l.message)),
        (r) => emit(state.copyWith(
            businessState: RequestState.success, getBusiness: r)));
  }
}
