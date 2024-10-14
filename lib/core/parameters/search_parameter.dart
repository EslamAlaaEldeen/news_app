import 'package:equatable/equatable.dart';

class SearchParameter extends Equatable {
  final String value;

  const SearchParameter({required this.value});

  @override
  List<Object> get props => [value];
}
