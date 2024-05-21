import 'package:conduit/util/constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  DioClient._internal() {
    _dio.options.baseUrl = Constants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 5);
  }

  final Dio _dio = Dio();
  Dio get dio => _dio;

  void setAuthHeader(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<Response> request({
    required String url,
    RequestType requestType = RequestType.GET,
    RequestBodyType requestBodyType = RequestBodyType.JSON,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      //Clear null or empty values from queryParameters and data
      queryParameters
          ?.removeWhere((key, value) => value == null || value == '');
      data?.removeWhere((key, value) => value == null || value == '');

      print("Making request to: ${_dio.options.baseUrl}$url");

      Response response = await dio.request(
        url,
        queryParameters: queryParameters,
        options: Options(
          method: requestType.toString().split('.').last,
          headers: headers,
          contentType: _getContentType(requestBodyType),
        ),
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print('Response: ${response.data}');
      return response;
    } on DioException catch (e) {
      print('DioException: $e');
      return _handleDioException(e, url);
    } on Exception catch (e) {
      print('Exception: $e');
      return _handleUnknownException(e, url);
    }
  }

  String _getContentType(RequestBodyType requestBodyType) {
    switch (requestBodyType) {
      case RequestBodyType.JSON:
        return Headers.jsonContentType;
      case RequestBodyType.FORM_DATA:
      case RequestBodyType.URL_ENCODED:
        return Headers.formUrlEncodedContentType;
      default:
        return Headers.jsonContentType;
    }
  }

  Response _handleDioException(DioException e, String url) {
    return Response(
      requestOptions: e.requestOptions,
      data: e.response?.data ?? e.message ?? 'Unknown error',
      statusCode: e.response?.statusCode ?? 500,
      statusMessage: e.response?.statusMessage ?? 'Unknown error',
    );
  }

  Response _handleUnknownException(Exception e, String url) {
    return Response(
      requestOptions: RequestOptions(path: url),
      data: e.toString(),
      statusCode: 500,
      statusMessage: 'Unknown error',
    );
  }
}

enum RequestType { GET, POST, PUT, DELETE, PATCH }

enum RequestBodyType { JSON, FORM_DATA, URL_ENCODED }
