part of 'process_bloc.dart';

@immutable
sealed class ProcessEvent {}

class StartProcess extends ProcessEvent {
  final ResponseData responseData;

  StartProcess(this.responseData);
}
