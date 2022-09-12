import 'package:paltl/database/database_controller.dart';
import 'package:paltl/models/user.dart';
import 'package:paltl/prefs/shared_pref_controller.dart';
import 'package:paltl/process_response.dart';
import 'package:sqflite/sqflite.dart';

class DBUserController{
  final Database _database = DataController().database;


  //login save in dataBase
  Future<ProcessResponse> login({required String mobile, required String password}) async {
    List<Map<String, dynamic>> rowsMap = await _database.query(
      User.tableName,
      where: 'mobile = ? AND password = ?',
      whereArgs: [mobile, password],
    );

    if(rowsMap.isNotEmpty) {
      User user = User.fromMap(rowsMap.first);
      SharedPrefController().save(user: user);
      return ProcessResponse(succsess: true, massage: 'Logged in successfully');
    }
    return ProcessResponse(massage: 'Credentials error, check and try again!');
  }
 //regester
  Future<ProcessResponse>   register({required User user}) async {
    if (await _isMobileExist(mobile: user.mobile)) {
      int newRowId = await _database.insert(User.tableName, user.toMap());
      return ProcessResponse(
        massage: newRowId != 0 ? 'Registered successfully' : 'Register failed!',
        succsess: newRowId != 0,
      );
    } else {
      return ProcessResponse(
        massage: 'Email exist, use another',
        succsess: false,
      );
    }
  }
  //mobile verfcation
  Future<bool> _isMobileExist({required String mobile}) async {
    List<Map<String, dynamic>> rowsMap = await _database
        .rawQuery('SELECT * FROM users WHERE email = ?', [mobile]);
    return rowsMap.isEmpty;
  }




}
