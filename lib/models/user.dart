class User {
  final String login;
  final String avatarURL;
  final String htmlURL;

  User(this.login, this.avatarURL, this.htmlURL);

  Map toJson() => {
        'login': login,
        'avatar_url': avatarURL,
        'html_url': htmlURL,
      };

  User.fromJson(Map json)
      : login = json['login'],
        avatarURL = json['avatar_url'],
        htmlURL = json['html_url'];
}
