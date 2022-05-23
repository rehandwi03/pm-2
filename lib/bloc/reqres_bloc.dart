import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pm_2/data/model/reqres_model.dart';
import 'package:pm_2/data/repository/reqres_repository.dart';

part 'reqres_event.dart';
part 'reqres_state.dart';

class ReqresBloc extends Bloc<ReqresEvent, ReqresState> {
  final ReqresRepository _reqresRepository;

  ReqresBloc(this._reqresRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final user = await _reqresRepository.getUser();
        emit(UserLoadedState(user));
      } catch (e) {
        print(e);
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
