import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:grid_repository/grid_repository.dart';
import 'package:meta/meta.dart';

part 'path_result_event.dart';
part 'path_result_state.dart';

class PathResultBloc extends Bloc<PathResultEvent, PathResultState> {
  final GridRepo _gridRepo;
  PathResultBloc(this._gridRepo) : super(PathResultInitial()) {
    on<SendResult>((event, emit) async {
      emit(SendResultLoading());
      try {
        await _gridRepo.sendResultData(event.results);
        emit(SendResultSuccess());
      } catch (e) {
        log(e.toString());
        emit(SendResultFailure());
      }
    });
  }
}
