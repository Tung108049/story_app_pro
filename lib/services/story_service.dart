import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:story_app_pro/constants/api_constants.dart';
import '../models/story_model.dart';

class StoryService {
  static Future<List<Story>> fetchStories() async{
    try{
      //Lấy dữ liệu
      final response = await http.get(Uri.parse(ApiConstants.getStories));

      //Nếu lấy thành công
      if(response.statusCode == 200){
        //chuyển thành map
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if(jsonResponse['status'] == 'success'){
          List<dynamic> dataList = jsonResponse['data'];
          return dataList.map((jsonItem) => Story.fromMap(jsonItem)).toList();
        } else {
          print('Lỗi từ API: ${jsonResponse['message']}');
          return [];
        }
      } else {
        return[];
      }
    }catch(e){
      print('Lỗi cmnr: $e');
      return [];
    }
  }
}