import 'package:flutter/material.dart';
import 'package:paltl/controller/problem_controller.dart';
import 'package:paltl/models/problem.dart';
import 'package:paltl/process_response.dart';

class ProblemProvider extends ChangeNotifier{

  List<Problem> Problems = <Problem>[];

  final ProblemsDbController _dbController = ProblemsDbController();


  Future<ProcessResponse> create(Problem problem) async {
    int newRowId = await _dbController.create(problem);
    if (newRowId != 0) {
      problem.id = newRowId;
      Problems.add(problem);
      notifyListeners();
    }
    return getResponse(newRowId != 0);
  }
  void read() async {
    Problems = await _dbController.read();
    notifyListeners();
  }

void readState(String state)async{
  Problems = await _dbController.readState(state);
  notifyListeners();
}


  Future<ProcessResponse> update(Problem problem) async {
    bool updated = await _dbController.update(problem);
    if(updated) {
      int index = Problems.indexWhere((element) => element.id == problem.id);
      if(index != -1) {
        Problems[index] = problem;
        notifyListeners();
      }
    }
    return getResponse(updated);
  }
  Future<ProcessResponse> delete(int index) async {
    bool deleted = await _dbController.delete(Problems[index].id);
    if(deleted) {
      Problems.removeAt(index);
      notifyListeners();
    }
    return getResponse(deleted);
  }
  ProcessResponse getResponse(bool success1) {
    return ProcessResponse(
      massage:
      success1 ? 'Operation completed successfully' : 'Operation failed!',
      succsess: success1,
    );
  }


}