import 'package:dio/dio.dart';
import 'package:ishop/utils/AppUtils.dart';
import 'package:logger/logger.dart';
import 'package:pretty_json/pretty_json.dart';

class LoggingInterceptor extends Interceptor {
  Logger LOG = AppUtils.LOGGER;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, String> fields = {
      'path':options.path,
      'method':options.method,
    };
    LOG.i(_displayArguments('Request Details', fields) + '\n' +  _displayBody('Request Body', options.data));
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Map<String, String> fields = {
      'path':response.requestOptions.path,
      'statusCode':response.statusCode.toString(),
    };
    LOG.i(_displayArguments('Response Details', fields) + '\n' + _displayBody('Response Body', response.data));
    super.onResponse(response, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    LOG.e('ERROR    [${err.response?.statusCode}] from [${err.requestOptions.path}]');
    super.onError(err, handler);
  }

  String _displayArguments(String title, Map<String, String> fields){
    String startTitle = '+++++++++++++++++++++++++++++++++++${title}++++++++++++++++++++++++++++++++' + '\n';
    String argStr = '';
    fields.forEach((key,value) => {
      argStr = argStr + '${key}: ${value}' + '\n'
    });
    String endTitle1 = '+++++++++++++++++++++++++++++++++++End ${title}++++++++++++++++++++++++++++';
    return startTitle + argStr + endTitle1;
  }

  String _displayBody(String title, Object? body){
    String divider1 = '\n' + '+++++++++++++++++++++++++++++++++++${title}+++++++++++++++++++++++++++++++++++';
    String responseBody = '\n' + '${prettyJson(body, indent: 2)}';
    String divider2 = '\n' + '+++++++++++++++++++++++++++++++++End ${title}++++++++++++++++++++++++++++++++';

    return divider1 + responseBody + divider2;
  }
}