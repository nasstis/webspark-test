import 'package:bloc/bloc.dart';
import 'package:finding_path/app.dart';
import 'package:finding_path/utils/helpers/simple_bloc_observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
