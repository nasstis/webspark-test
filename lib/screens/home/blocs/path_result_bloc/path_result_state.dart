part of 'path_result_bloc.dart';

@immutable
sealed class PathResultState {}

final class PathResultInitial extends PathResultState {}

final class SendResultLoading extends PathResultState {}

final class SendResultSuccess extends PathResultState {}

final class SendResultFailure extends PathResultState {}
