import 'package:dio/dio.dart';
import 'package:linkyou_task/core/constants/api_constants.dart';

class DioHelper {
  static  late Dio _dio;
  static void InitDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl
      ));
  }

  static Future<Response> postData({required String url , required String displayname})async{
    return await _dio.post(url,data: {
      "name":displayname,
      "job":"Flutter Developer"
    });
  }
  static Future<Response> getData(String url)async{
    return await _dio.get(url);
  }

}
