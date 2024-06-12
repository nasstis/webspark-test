part of 'response_data_bloc.dart';

@immutable
sealed class ResponseDataState {}

final class ResponseDataInitial extends ResponseDataState {}

final class GetResponseDataSuccess extends ResponseDataState {
  final ResponseData responseData;

  GetResponseDataSuccess(this.responseData);
}

final class GetResponseDataLoading extends ResponseDataState {}

final class GetResponseDataFailure extends ResponseDataState {
  final String message;

  GetResponseDataFailure(this.message);
}
