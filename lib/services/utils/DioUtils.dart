import 'package:dio/dio.dart';
import '../interceptors/LoggingInterceptor.dart';

class ApiUtils {
  static final ApiUtils instance = ApiUtils.privateConstructor();
  static final Dio DIO = Dio();
  factory ApiUtils() {
    return instance;
  }
  ApiUtils.privateConstructor(){
    DIO.interceptors.add(LoggingInterceptor());
  }

  getDio(){
    return DIO;
  }
}
