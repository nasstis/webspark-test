import 'package:finding_path/utils/constants/colors.dart';
import 'package:finding_path/utils/constants/constant_data.dart';
import 'package:finding_path/utils/helpers/get_field_color.dart';
import 'package:flutter/material.dart';
import 'package:grid_repository/grid_repository.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.gridIndex});

  final int gridIndex;

  @override
  Widget build(BuildContext context) {
    final PathResult? result =
        DataService().getResultDataList()?[gridIndex].result;
    final GridData? gridData = DataService().getResponseData()?.data[gridIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Screen'),
      ),
      body: result != null && gridData != null
          ? Column(
              children: [
                Container(
                  color: Colors.black,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridData.field.length,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      ),
                      shrinkWrap: true,
                      itemCount: gridData.field.length * gridData.field.length,
                      itemBuilder: (context, index) {
                        Color color = getFieldColor(
                          index % gridData.field.length,
                          (index / gridData.field.length).floor(),
                          gridData.field,
                          gridData.start,
                          gridData.end,
                          result.steps,
                        );
                        return Container(
                          color: color,
                          child: Center(
                            child: Text(
                              '(${index % gridData.field.length}, ${(index / gridData.field.length).floor()})',
                              style: TextStyle(
                                fontSize: 18,
                                color: color == MyColors.blockedPoint
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 5),
                Text(
                  result.path,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          : const Center(
              child: Text('Something went wrong...'),
            ),
    );
  }
}
