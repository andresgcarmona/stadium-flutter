class User {
  final String username;
  final String avatarURL;
  final String email;

  User(this.username, this.avatarURL, this.email);

  Map toJson() => {
        'username': username,
        'avatar': avatarURL,
        'email': email,
      };

  User.fromJson(Map json)
      : username = json['user']['username'],
        avatarURL = json['user']['avatar'],
        email = json['user']['email'];
}
