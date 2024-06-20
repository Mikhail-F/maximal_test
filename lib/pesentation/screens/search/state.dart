import 'package:equatable/equatable.dart';
import 'package:search_users_test/domain/entities/search/search_item.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final bool isError;
  final List<SearchItem> users;

  const SearchState({
    this.isLoading = false,
    this.isError = false,
    this.users = const [],
  });

  @override
  List<Object?> get props => [isLoading, isError, users];

  SearchState copyWith(
      {bool? isLoading, bool? isError, List<SearchItem>? users}) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      users: users ?? this.users,
    );
  }
}
