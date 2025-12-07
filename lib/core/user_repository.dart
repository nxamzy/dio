import 'package:flutter_application_dio/const/utlis.dart';
import 'package:flutter_application_dio/core/dio_client.dart';
import 'package:flutter_application_dio/model/model.dart';

class UserRepository {
  Future<List<TodoModel>> getUser() async{
    try{
      final result = await ApiClient().getData(ApiConstants.todosUrl);
      final List data = result;
      print("$data");
      return data.map((e)=>TodoModel.fromJson(e)).toList();
    } catch (e){
      print("$e");
      throw Exception(e); 
    }
  }
}