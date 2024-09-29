import 'package:dio/dio.dart';
import 'package:linkyou_task/core/constants/api_constants.dart';
import 'package:linkyou_task/core/helper/dio_helper.dart';

class PostNewUser{
  
  static Future<Response> addNewUser(String displayname)async{
  return await DioHelper.postData(url: ApiConstants.postUser, displayname: displayname);
  }
}