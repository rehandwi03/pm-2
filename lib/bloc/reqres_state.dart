part of 'reqres_bloc.dart';

@immutable
abstract class ReqresState extends Equatable {}

class UserErrorState extends ReqresState {
  final String error;

  UserErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoadedState extends ReqresState {
  final User user;

  UserLoadedState(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class UserLoadingState extends ReqresState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
