import 'package:finding_path/screens/home/blocs/response_data_bloc/response_data_bloc.dart';
import 'package:finding_path/screens/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_repository/grid_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ResponseDataBloc(GridRepoImpl()),
        child: const MyHomePage(),
      ),
    );
  }
}
