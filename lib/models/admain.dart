class Admin{
  late int id ;
  late String name;
  late String mobile;
  late String password;
  static const String tableName = 'admin';

  Admin();

  Admin.fromMap(Map<String, dynamic> rowMap){
    id = rowMap['id'];
    name = rowMap['name'];
    mobile = rowMap['mobile'];
    password = rowMap['password'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name']= name;
    map['mobile']= mobile;
    map['password']= password;
    return map;
  }


}