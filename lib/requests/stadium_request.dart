import 'package:http/http.dart' as http;

class Stadium {
  final String username;
  final String password;
  final String host = 'http://10.0.2.2:8022/';

  Stadium(this.username, this.password);

  Future<http.Response> authenticateUser() async {
    Map<String, String> data = {
      'username': this.username,
      'password': this.password,
    };

    Map<String, String> headers = {
      'Accept': 'application/json'
    };

    return http.post(host + 'api/v1/login', headers: headers, body: data);
  }
}
