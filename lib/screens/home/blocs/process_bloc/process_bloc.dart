import 'package:bloc/bloc.dart';
import 'package:finding_path/utils/constants/constant_data.dart';
import 'package:finding_path/utils/helpers/find_shortest_path.dart';
import 'package:grid_repository/grid_repository.dart';
import 'package:meta/meta.dart';

part 'process_event.dart';
part 'process_state.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  ProcessBloc() : super(ProcessInitial()) {
    on<StartProcess>((event, emit) async {
      emit(ProcessStarted());
      int totalGrids = event.responseData.data.length;
      List<ResultData> pathResults = [];
      for (int i = 0; i < totalGrids; i++) {
        final path = findShortestPath(event.responseData.data[i].field,
            event.responseData.data[i].start, event.responseData.data[i].end);
        await Future.delayed(
          const Duration(milliseconds: 800),
        ); // Small delay so that the computing process is visible

        pathResults.add(ResultData(
            id: event.responseData.data[i].id,
            result: PathResult(path: path.join('->'), steps: path)));

        double progress = ((i + 1) / totalGrids) * 100;
        emit(ProcessProgressChanged(progress));
      }
      DataService().setResultData(pathResults);
      emit(ProcessFinished(pathResults));
    });
  }
}
