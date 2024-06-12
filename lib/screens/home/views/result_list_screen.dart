import 'package:finding_path/screens/home/views/preview_screen.dart';
import 'package:finding_path/utils/constants/constant_data.dart';
import 'package:flutter/material.dart';
import 'package:grid_repository/grid_repository.dart';

class ResulListScreen extends StatelessWidget {
  const ResulListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ResultData>? results = DataService().getResultDataList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result List Screen'),
      ),
      body: results != null
          ? ListView.separated(
              itemCount: results.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  results[index].result.path,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewScreen(
                        gridIndex: index,
                      ),
                    ),
                  );
                },
              ),
            )
          : const Center(
              child: Text('Something went wrong...'),
            ),
    );
  }
}
