import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finding_path/utils/constants/constant_data.dart';
import 'package:grid_repository/grid_repository.dart';
import 'package:meta/meta.dart';

part 'response_data_event.dart';
part 'response_data_state.dart';

class ResponseDataBloc extends Bloc<ResponseDataEvent, ResponseDataState> {
  final GridRepo _gridRepo;

  ResponseDataBloc(this._gridRepo) : super(ResponseDataInitial()) {
    on<GetResponseData>((event, emit) async {
      emit(GetResponseDataLoading());
      try {
        final ResponseData responseData =
            await _gridRepo.getGridResponseData(event.url);
        DataService().setResponseData(responseData);
        emit(GetResponseDataSuccess(responseData));
      } catch (e) {
        log(e.toString());
        emit(GetResponseDataFailure(e.toString()));
      }
    });
  }
}
