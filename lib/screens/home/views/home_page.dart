import 'package:finding_path/screens/home/blocs/path_result_bloc/path_result_bloc.dart';
import 'package:finding_path/screens/home/blocs/process_bloc/process_bloc.dart';
import 'package:finding_path/screens/home/blocs/response_data_bloc/response_data_bloc.dart';
import 'package:finding_path/screens/home/views/process_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_repository/grid_repository.dart';

import '../../../utils/helpers/url_validator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _urlController = TextEditingController();

  bool requestSended = false;

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResponseDataBloc, ResponseDataState>(
      listener: (context, state) {
        if (state is GetResponseDataFailure) {
          setState(() {
            requestSended = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        if (state is GetResponseDataLoading) {
          setState(() {
            requestSended = true;
          });
        }
        if (state is GetResponseDataSuccess) {
          setState(() {
            requestSended = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        ProcessBloc()..add(StartProcess(state.responseData)),
                  ),
                  BlocProvider(
                    create: (context) => PathResultBloc(
                      GridRepoImpl(),
                    ),
                  ),
                ],
                child: const ProcessScreen(),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Set valid API base URL in order to continue',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.compare_arrows,
                        color: Colors.grey.shade600,
                      ),
                      Form(
                        key: _formKey,
                        child: SizedBox(
                          width: 320,
                          child: TextFormField(
                            controller: _urlController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a URL';
                              } else if (!isValidURL(value)) {
                                return 'Please enter a valid URL';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Paste URL here...',
                              focusedBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40,
                child: ElevatedButton(
                  onPressed: requestSended
                      ? null
                      : () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<ResponseDataBloc>().add(
                                  (GetResponseData(url: _urlController.text)),
                                );
                          }
                        },
                  child: requestSended
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('Start counting process'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
