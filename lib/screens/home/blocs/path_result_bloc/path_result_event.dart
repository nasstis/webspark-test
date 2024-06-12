part of 'path_result_bloc.dart';

@immutable
sealed class PathResultEvent {}

class SendResult extends PathResultEvent {
  final List<ResultData> results;

  SendResult(this.results);
}
