part of 'user_bloc.dart';

class DeleteUserErrorState extends UserState {
  final String message;

  DeleteUserErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class DeleteUserLoadingState extends UserState {}

class DeleteUserSuccessState extends UserState {
  final String message;

  DeleteUserSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class EditUserErrorState extends UserState {
  final String message;

  EditUserErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class EditUserLoadingState extends UserState {}

class EditUserSuccessState extends UserState {
  final String message;

  EditUserSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class FetchUserLoadedState extends UserState {
  final List<UserModel> users;

  FetchUserLoadedState({required this.users});

  @override
  List<Object> get props => [users];
}

class GetUserErrorState extends UserState {}

class GetUserLoadedState extends UserState {
  final UserModel user;

  GetUserLoadedState({required this.user});

  @override
  List<Object> get props => [user];
}

class GetUserLoadingState extends UserState {}

class UserAddErrorState extends UserState {}

class UserAddLoadingState extends UserState {}

class UserAddSuccessState extends UserState {}

class UserErrorState extends UserState {
  final String error;
  UserErrorState({required this.error});
}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}
