import 'dart:convert';

import 'package:get_api_integration/Models/PostModel.dart';
import 'package:get_api_integration/Models/post_details_model.dart';
import 'package:http/http.dart' as http;

// class ApiSearvices{
 

//   static Future<List<PostModel>?> fetchData() async {

//     final urlParse = Uri.parse("https://jsonplaceholder.typicode.com/users");
//     final response = await http.get(urlParse);

//     if(response.statusCode == 200){
//     print("Success");

//     var data = jsonDecode(response.body.toString());

//     for(var mostakim in data){
//       data.add(PostModel.fromJson(mostakim));
//     }
//     return data;
//   }else{
//     print("Failed");
//     return null;
//   }
//   }
// }
 class ApiSearvices{
  
   static Future<PostDetailsModel?> fetchSingleData (String id) async {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));

      if(response.statusCode == 200){
        final dataDetails = jsonDecode(response.body.toString());

        
      return PostDetailsModel.fromJson(dataDetails);

      }else{
        print("Error");
        return null;
      }
    }
}
 