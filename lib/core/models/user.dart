class User {
  final String username;
  final String avatarURL;
  final String email;

  User({this.username, this.avatarURL, this.email});

  User.initial()
      : username = '',
        avatarURL = '',
        email = '';

  Map toJson() => {
        'username': username,
        'avatar': avatarURL,
        'email': email,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['user']['username'],
      avatarURL: json['user']['avatar'],
      email: json['user']['email'],
    );
  }
}
