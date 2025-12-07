import 'package:dio/dio.dart';
import 'package:flutter_application_dio/const/utlis.dart';

class ApiClient {
  Future getData(String todosUrl) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)).get(todosUrl);
      
      return response.data;
      
    } catch (e){
      throw Exception(e);
    }
  }
}
