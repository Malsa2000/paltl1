import 'package:paltl/database/database_controller.dart';
import 'package:paltl/prefs/shared_pref_controller.dart';
import 'package:sqflite/sqflite.dart';
import '../models/problem.dart';

class ProblemsDbController{

  final Database database = DataController().database;

  Future<int> create(Problem model) async {
    return await database.insert(Problem.tableName, model.toMap());
  }

  Future<bool> delete(int id) async {
    int countOfDeletedRows = await database
        .delete(Problem.tableName, where: 'id= ?', whereArgs: [id]);
    return countOfDeletedRows == 1;
  }

  Future<List<Problem>> read() async {
    int userId = SharedPrefController().getValueFor<int>(PrefKeys.id.name)!;

    List<Map<String, dynamic>> rowsMap = await database.query(Problem.tableName,
        where: 'user_id = ?', whereArgs: [userId]);
    return rowsMap.map((rowMap) => Problem.fromMap(rowMap)).toList();
  }

  Future<bool> update(Problem model) async {
    int countOfUpdatedRows = await database.update(
      Problem.tableName,
      model.toMap(),
      where: 'id = ? AND state =?',
      whereArgs: [model.id ,model.state],
    );
    return countOfUpdatedRows == 1;
  }

Future<List<Problem>> readState(String State) async{
  List<Map<String, dynamic>> rowsMap = await database.query(Problem.tableName,
      where: 'state = ?', whereArgs: [State]);
  return rowsMap.map((rowMap) => Problem.fromMap(rowMap)).toList();
}

  Future<Problem?> show(int id) async {
    List<Map<String, dynamic>> rowsMap = await database
        .query(Problem.tableName, where: 'id = ?', whereArgs: [id]);
    return rowsMap.isNotEmpty ? Problem.fromMap(rowsMap.first) : null;
  }
}