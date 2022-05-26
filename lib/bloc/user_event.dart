part of 'user_bloc.dart';

class AddUserEvent extends UserEvent {
  String nama;
  String alamat;

  AddUserEvent({required this.nama, required this.alamat});
}

class DeleteUserByIDEvent extends UserEvent {
  String id;
  DeleteUserByIDEvent({required this.id});
}

class EditUserEvent extends UserEvent {
  final String id;
  final String nama;
  final String alamat;

  EditUserEvent({required this.id, required this.nama, required this.alamat});
}

class FetchUserEvent extends UserEvent {}

class GetUserByIDEvent extends UserEvent {
  String id;
  GetUserByIDEvent({required this.id});
}

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}
