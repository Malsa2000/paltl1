class User{
 late int id ;
 late String name;
 late String mobile;
 late String password;
 late String city;


 User();
 static const String tableName = 'users';
 User.fromMap(Map<String, dynamic> rowMap){
   id = rowMap['id'];
   name = rowMap['name'];
   mobile = rowMap['mobile'];
   password = rowMap['password'];
   city = rowMap['city'];
 }

 Map<String, dynamic> toMap() {
   Map<String, dynamic> map = <String, dynamic>{};
   map['name']= name;
   map['mobile']= mobile;
   map['password']= password;
   map['city']= city;
   return map;
 }


}