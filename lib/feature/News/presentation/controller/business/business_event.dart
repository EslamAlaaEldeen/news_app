part of 'business_bloc.dart';

abstract class BusinessEvent extends Equatable {
  const BusinessEvent();
  @override
  List<Object?> get props => [];
}

class GetBusinessEvent extends BusinessEvent {}
