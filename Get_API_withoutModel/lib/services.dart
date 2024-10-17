import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<dynamic> getUserData() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
