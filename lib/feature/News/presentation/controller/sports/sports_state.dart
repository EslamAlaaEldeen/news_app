part of 'sports_bloc.dart';

class SportsState extends Equatable {
  final List<News> getSports;
  final RequestState sportsState;
  final String sportsMessage;

  const SportsState(
      {this.getSports = const [],
      this.sportsState = RequestState.loading,
      this.sportsMessage = ''});

  SportsState copyWith({
    List<News>? getSports,
    RequestState? sportsState,
    String? sportsMessage,
  }) {
    return SportsState(
      getSports: getSports ?? this.getSports,
      sportsState: sportsState ?? this.sportsState,
      sportsMessage: sportsMessage ?? this.sportsMessage,
    );
  }

  @override
  List<Object?> get props => [getSports, sportsState, sportsMessage];
}
