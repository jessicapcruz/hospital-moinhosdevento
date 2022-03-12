//importing HTTP package for fetching and consuming HTTP resources
import 'package:http/http.dart' as http;
//Github request class
class UserRequest {
  final String userName; // usernaname
  final String url = 'http://challenge-fiap-api-paciente.sa-east-1.elasticbeanstalk.com/paciente/1';
  static String clientId = 'CLIENT_ID'; //enter yout client id
  static String clientSecret = 'CLIENT_SECRET'; // insert your client secret

  UserRequest(this.userName);

  //Fetch a user with the username supplied in the form input
  Future<http.Response> fetchUser() {
    return http.get(Uri.parse(url + 'users/' + userName));
  }

  Future<http.Response> fetchFollowers() {
    return http.get(Uri.parse(url + '/' + userName ));
  }

  Future<http.Response> fetchRepos() {
    return http.get(Uri.parse( url + 'users/' + userName + '/repos'));
  }
}