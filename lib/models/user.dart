class User{
  final String userID;
  final String name;
  final String email;
  final String password;
  // final String phone;
  User({
    this.userID,
    this.email,
    this.name,
    this.password,
    // this.phone
  });
  static User fromJSON(Map<String,dynamic> map){
    return User(
      email: map['email'],
      userID: map['_id'],
      password: map['password'],
      name: map['name']
    );
  }
}