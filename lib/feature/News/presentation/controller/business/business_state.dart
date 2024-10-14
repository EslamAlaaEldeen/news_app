part of 'business_bloc.dart';

class BusinessState extends Equatable {
  final List<News> getBusiness;
  final RequestState businessState;
  final String businessMessage;

  const BusinessState(
      {this.getBusiness = const [],
      this.businessState = RequestState.loading,
      this.businessMessage = ''});

  BusinessState copyWith({
    List<News>? getBusiness,
    RequestState? businessState,
    String? businessMessage,
  }) {
    return BusinessState(
      getBusiness: getBusiness ?? this.getBusiness,
      businessState: businessState ?? this.businessState,
      businessMessage: businessMessage ?? this.businessMessage,
    );
  }

  @override
  List<Object?> get props => [getBusiness, businessState, businessMessage];
}
