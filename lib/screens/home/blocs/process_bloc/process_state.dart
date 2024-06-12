part of 'process_bloc.dart';

@immutable
sealed class ProcessState {}

final class ProcessInitial extends ProcessState {}

final class ProcessStarted extends ProcessState {}

final class ProcessProgressChanged extends ProcessState {
  final double progress;

  ProcessProgressChanged(this.progress);
}

final class ProcessFinished extends ProcessState {
  final List<ResultData> pathResults;

  ProcessFinished(this.pathResults);
}
