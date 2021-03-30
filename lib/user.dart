class User{
  String email;
  String pass;

  User({this.email, this.pass});

  Map toMap(User user){
    var map = <String,String>{};
    map['email'] = user.email;
    map['pass'] = user.pass;
    return map;
  }

}