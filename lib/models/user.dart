class User{
 late int id ;
 late String name;
 late String mobile;
 late String password;
 late String? userIdntfcation;
 late String? telephone;


 User();
 static const String tableName = 'users';
 User.fromMap(Map<String, dynamic> rowMap){
   id = rowMap['id'];
   name = rowMap['name'];
   mobile = rowMap['mobile'];
   password = rowMap['password'];
   userIdntfcation = rowMap['identfcation'];
   telephone = rowMap['telephone'];

 }

 Map<String, dynamic> toMap() {
   Map<String, dynamic> map = <String, dynamic>{};
   map['name']= name;
   map['mobile']= mobile;
   map['password']= password;
   map['identfcation']= userIdntfcation;
   map['telephone'] =telephone;

   return map;
 }


}