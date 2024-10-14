part of 'science_bloc.dart';

class ScienceState extends Equatable {
  final List<News> getScience;
  final RequestState scienceState;
  final String scienceMessage;

  const ScienceState(
      {this.getScience = const [],
      this.scienceState = RequestState.loading,
      this.scienceMessage = ''});

  ScienceState copyWith({
    List<News>? getScience,
    RequestState? scienceState,
    String? scienceMessage,
  }) {
    return ScienceState(
      getScience: getScience ?? this.getScience,
      scienceState: scienceState ?? this.scienceState,
      scienceMessage: scienceMessage ?? this.scienceMessage,
    );
  }

  @override
  List<Object?> get props => [getScience, scienceState, scienceMessage];
}
