import 'package:getdata_withmodel_api/Models/api_model.dart';
import 'package:http/http.dart' as http;

class GetApiService{
  
  Future<List<CommentData>?> getData()async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if(response.statusCode == 200){
      var data = response.body;
      return commentDataFromJson(data);
    }
    else{
      return null;
    }
  }
}