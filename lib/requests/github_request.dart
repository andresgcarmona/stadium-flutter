import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class Github {
  final String username;
  final String url = 'https://api.github.com/';

  static String clientId = '3d1fefcd490a2e678ce3';
  static String clientSecret = '6f83fc6c0b04e316ebb4618429ebf8f0fdbf113b';

  final String query = "?client=$clientId&client_secret=$clientSecret";

  final Map<String, String> headers = {
    'Authorization':
        'Basic ' + base64.encode(utf8.encode(clientId + ':' + clientSecret))
  };

  Github(this.username);

  Future<http.Response> fetchUser() async {
    log(url + 'users/' + username + query);

    return http.get(url + 'users/' + username + query);
  }


  Future<http.Response> fetchFollowing() async =>
      http.get(url + 'users/' + username + '/following' + query);
}
