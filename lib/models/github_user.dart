class GithubUser {
  final String login;
  final String avatarURL;
  final String htmlURL;

  GithubUser(this.login, this.avatarURL, this.htmlURL);

  Map toJson() => {
        'login': login,
        'avatar_url': avatarURL,
        'html_url': htmlURL,
      };

  GithubUser.fromJson(Map json)
      : login = json['login'],
        avatarURL = json['avatar_url'],
        htmlURL = json['html_url'];
}
