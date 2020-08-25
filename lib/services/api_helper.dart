import 'dart:convert';

import 'package:blog_app/model/custom_list.dart';
import 'package:http/http.dart' as http;

class APIHelper {

  static final API = "https://agile-reaches-87924.herokuapp.com";

  Future<List<CustomList>> getAllData() {
    return http.get("${API}/posts/getAll").then((value) {
      if(value.statusCode == 200) {
        var data = jsonDecode(value.body);
        final list = <CustomList>[];
        for(var item in data) {
          final customList = CustomList(
            title: item["title"],
            content: item["content"]
          );
          list.add(customList);
        }
        return list;
      }
    }).catchError((error) => print("An Error Occured"));
  }

  addPost(String title, String content) async {
    var response = await http.post("${API}/posts/${title}&${content}/addPost");
    print(response.body);
  }
  
  updateSpecificPost(String title, String newTitle) async {
    var response = await http.put("${API}/posts/updateSpecific/${title}/setTo/${newTitle}");
    print(response.body);
  }

  deleteSpecificPost(String title) async {
    var response = await http.delete("${API}/posts/deleteSpecific/${title}");
    print(response.body);
  }

  Future<List<CustomList>> getSpecificData(String title) {
    return http.get("${API}/posts/getSpecific/${title}").then((value) {
      if(value.statusCode == 200) {
        var data = jsonDecode(value.body);
        final list = <CustomList>[];
        for(var item in data) {
          final customList = CustomList(
              title: item["title"],
              content: item["content"]
          );
          list.add(customList);
        }
        return list;
      }
    }).catchError((error) => print("An Error Occured"));
  }

}
