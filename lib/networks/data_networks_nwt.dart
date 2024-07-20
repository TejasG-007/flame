
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:porfoliov7/model/git_data.dart';

class DataNetworks{

  final String url = "https://raw.githubusercontent.com/TejasG-007/ProjectData/main/projectdata.json";


  Future<GitData?> getDataFromGitHub()async{
    try{
      final Uri gitUrl = Uri.parse(url);
      final http.Response response = await http.get(gitUrl);
      if(response.statusCode ==200){
       final data = jsonDecode(response.body);
       final gitData = GitData.fromMap(data);
       return gitData;
      }else{
        return null;
      }
    }catch(e){
     log("Error While Fetching data | $e");
      return null;
    }
  }
}