import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            "Content-Type": "application/json",
          }),
    );
  }

  static Future<Response> getData(
      {required String path, required Map<String, dynamic> query}) async {
    return await dio!.get(path, queryParameters: query);
  }

  static Future<Response> PostData(
      {required String path,
      Map<String, dynamic>? query,
      required Map<String, dynamic> Data}) async {
    return await dio!.post(path,
     queryParameters: query , 
     data: Data
     );
  }
}
