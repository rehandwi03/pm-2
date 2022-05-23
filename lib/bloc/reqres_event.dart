part of 'reqres_bloc.dart';

class LoadUserEvent extends ReqresEvent {
  @override
  List<Object?> get props => throw [];
}

@immutable
abstract class ReqresEvent extends Equatable {}
