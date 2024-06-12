part of 'response_data_bloc.dart';

@immutable
sealed class ResponseDataEvent {}

class GetResponseData extends ResponseDataEvent {
  final String url;

  GetResponseData({required this.url});
}
