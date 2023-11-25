class User {
  String? id, name, avatar, email, city;

  User({this.id, this.name, this.avatar, this.email, this.city});

  // convert json to model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      email: json['email'],
      city: json['city'],
    );
  }
}
