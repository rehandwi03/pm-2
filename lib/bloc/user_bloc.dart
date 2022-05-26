import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pm_2/data/model/user_model.dart';
import 'package:pm_2/data/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<EditUserEvent>(
      (event, emit) async {
        emit(EditUserLoadingState());

        try {
          final message = await _userRepository.editUser(
              event.id, event.nama, event.alamat);

          emit(EditUserSuccessState(message: message));
        } catch (e) {
          emit(UserErrorState(error: e.toString()));
        }
      },
    );
    on<FetchUserEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final users = await _userRepository.fetchUser();
        emit(FetchUserLoadedState(users: users));
      } catch (e) {
        emit(UserErrorState(error: e.toString()));
      }
    });
    on<AddUserEvent>((event, emit) async {
      emit(UserAddLoadingState());

      try {
        final result = await _userRepository.addUser(event.nama, event.alamat);
        emit(UserAddSuccessState());
      } catch (e) {
        emit(UserErrorState(error: e.toString()));
      }
    });
    on<GetUserByIDEvent>(((event, emit) async {
      emit(GetUserLoadingState());

      try {
        final user = await _userRepository.getUserByID(event.id);
        emit(GetUserLoadedState(user: user));
      } catch (e) {
        emit(UserErrorState(error: e.toString()));
      }
    }));
    on<DeleteUserByIDEvent>(((event, emit) async {
      emit(DeleteUserLoadingState());

      try {
        final message = await _userRepository.deleteUser(event.id);
        emit(DeleteUserSuccessState(message: message));
      } catch (e) {
        emit(DeleteUserErrorState(message: e.toString()));
      }
    }));
  }
}
