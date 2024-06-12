import 'package:finding_path/screens/home/blocs/path_result_bloc/path_result_bloc.dart';
import 'package:finding_path/screens/home/blocs/process_bloc/process_bloc.dart';
import 'package:finding_path/screens/home/views/result_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_repository/grid_repository.dart';

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  bool processStarted = false;
  bool sendResultStarted = false;
  double progress = 0;
  List<ResultData> pathResults = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Process Screen'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MultiBlocListener(
            listeners: [
              BlocListener<ProcessBloc, ProcessState>(
                listener: (context, state) {
                  if (state is ProcessProgressChanged) {
                    setState(() {
                      progress = state.progress;
                    });
                  }
                  if (state is ProcessStarted) {
                    setState(() {
                      processStarted = true;
                    });
                  }
                  if (state is ProcessFinished) {
                    setState(() {
                      processStarted = false;
                      pathResults = state.pathResults;
                    });
                  }
                },
              ),
              BlocListener<PathResultBloc, PathResultState>(
                listener: (context, state) {
                  if (state is SendResultLoading) {
                    setState(() {
                      sendResultStarted = true;
                    });
                  }
                  if (state is SendResultSuccess) {
                    setState(() {
                      sendResultStarted = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResulListScreen(),
                        ));
                  }
                  if (state is SendResultFailure) {
                    setState(() {
                      sendResultStarted = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Something went wrong... please, try again later'),
                      ),
                    );
                  }
                },
              ),
            ],
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        processStarted
                            ? 'Please wait while the calculation is performed'
                            : 'All calculations has finished, you can send your results to server',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '${progress.round()}%',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Divider(),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          value: progress / 100,
                          strokeWidth: 5,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                if (!processStarted)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: sendResultStarted
                            ? null
                            : () {
                                context.read<PathResultBloc>().add(
                                      SendResult(pathResults),
                                    );
                              },
                        child: sendResultStarted
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Send results to server'),
                      ),
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}
