class Problem{
  static const  tableName = 'problems';
 late int id ;
 late String titileProblem;
 late String date;
 late String description;
 late  String state ;
  late  String city ;
  //late  String image ;
  late int userId;



  Problem();
  Problem.fromMap(Map<String, dynamic> rowMap) {
    this.id = rowMap['id'];
    this.titileProblem = rowMap['title'];
    this.description = rowMap['description'];
    this.date = rowMap['date'];
    this.state = rowMap['state'];
    this.userId = rowMap['user_id'];
    this.city = rowMap['city'];

  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    rowMap['title'] = this.titileProblem;
    rowMap['description'] = this.description;
    rowMap['date'] = this.date;
    rowMap['state'] = this.state;
    rowMap['city'] = this.city;
    rowMap['user_id'] = this.userId;

    return rowMap;
  }


}