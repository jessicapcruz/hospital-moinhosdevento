import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/user/user.dart';
import '../requests/userRequest.dart';

class UserProvider with ChangeNotifier {
  late User user; //an instance of a user
  late String errorMessage; //error message
  bool loading = false; //loading the page

  Future<bool> fetchUser(username) async {
    setLoading(true);
    // fetch user from the input supplied in the form
    await UserRequest(username).fetchUser().then((data) {
      setLoading(false);
      if (data.statusCode == 200) {
        //incase of success
        setUser(User.fromJson(json.decode(data.body)));
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']); // error message
      }
    });
    return isUser(); //returns the fetched user
  }

  bool isLoading() {
    return loading; //return true if the app is loading the data
  }

  void setLoading(value) {
    loading = value;
    notifyListeners(); //This method is called when the objects is changed
  }

  void setUser(value) {
    user = value;
    notifyListeners(); //alert listeners that user's value changed
  }

  User getUser() {
    return user; //returns the fetched user
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners(); // alert listeners that the error message changed
  }

  String getMessage() {
    return errorMessage; // get the error message
  }

  bool isUser() {
    return user != null ? true : false; // returns true if user is not null, anf false otherwise
  }
}