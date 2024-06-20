import 'package:equatable/equatable.dart';
import 'package:search_users_test/domain/entities/user/user.dart';

class UserDetailState extends Equatable {
  final bool isLoading;
  final bool isError;
  final List<RepositoryItem> resitories;

  const UserDetailState({
    this.isLoading = false,
    this.isError = false,
    this.resitories = const [],
  });

  @override
  List<Object?> get props => [isLoading, isError, resitories];

  UserDetailState copyWith(
      {bool? isLoading, bool? isError, List<RepositoryItem>? resitories}) {
    return UserDetailState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      resitories: resitories ?? this.resitories,
    );
  }
}
