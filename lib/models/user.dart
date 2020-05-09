class User{
  final String userID;
  final String name;
  final String email;
  final String password;
  final String profile;
  User({
    this.userID,
    this.email,
    this.name,
    this.password,
    this.profile
  });
  static User fromJSON(Map<String,dynamic> map){
    return User(
      email: map['email'],
      userID: map['_id'],
      password: map['password'],
      name: map['name'],
      profile:map['profile']
    );
  }
}