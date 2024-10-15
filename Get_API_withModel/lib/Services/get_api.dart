import 'package:get_api_withmodel/Models/getDataModel.dart';
import 'package:http/http.dart' as http;
class GetApi {

  Future<List<GetCommentsData>?> getDataNew() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if(response.statusCode == 200){
      return getCommentsDataFromJson(response.body);
    } 
    else{
      return null;
    }
  }

}