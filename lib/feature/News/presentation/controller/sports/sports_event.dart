part of 'sports_bloc.dart';

abstract class SportsEvent extends Equatable {
  const SportsEvent();
  @override
  List<Object?> get props => [];
}

class GetSportsEvent extends SportsEvent {}
