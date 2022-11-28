import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:odindio/odin_reflect.dart';

class OdinDio {
  OdinDio._internal();
  static final OdinDio _instance = OdinDio._internal();
  static final Dio _dio = Dio();
  factory OdinDio(){
    _dio.interceptors.add(_logInterceptor);
    return _instance;
  }
  static final LogInterceptor _logInterceptor = LogInterceptor();
  Interceptors interceptors() => _dio.interceptors;

  void removeDioLog(){
    _dio.interceptors.remove(_logInterceptor);
  }

  void addDioLog(){
    _dio.interceptors.add(_logInterceptor);
  }

  void setDioLogStatus({
    bool request = true,
    bool requestHeader = true,
    bool requestBody = false,
    bool responseHeader = true,
    bool responseBody = false,
    bool error = true,
    Function(Object object) logPrint = print,
  }){
    _logInterceptor.request = request;
    _logInterceptor.requestHeader = requestHeader;
    _logInterceptor.requestBody = requestBody;
    _logInterceptor.responseHeader = responseHeader;
    _logInterceptor.responseBody = responseBody;
    _logInterceptor.error = error;
    _logInterceptor.logPrint = logPrint;
  }

  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  T dioResultToModel<T>(dynamic data){
    var value = OdinReflect.reflectInstanceFromMap<T>(data);
    return value;
  }

  List<T> dioResultToModels<T>(dynamic data){
    var lst = <T>[];
    for(var item in data){
      lst.add(dioResultToModel<T>(item));
    }
    return lst;
  }

  dynamic dataToFormData(Map<String,dynamic> data, [
    ListFormat collectionFormat = ListFormat.multi,
  ]){
    return FormData.fromMap(data,collectionFormat);
  }

  Stream<List<T>> listIntToStreamFormData<T>(Iterable<T> elements){
    return Stream.fromIterable(elements.map((e) => [e]));
  }

  /// get request method
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    options ??= Options(responseType: ResponseType.json);
    options.responseType = ResponseType.json;
    var response = await _dio.get<T>(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    //json.decode(response.data)
    return response;
  }

  /// get method request return Model
  Future<T> getModel<T>(String path,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    options ??= Options(responseType: ResponseType.json);
    options.responseType = ResponseType.json;
    var response = await get<dynamic>(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    return dioResultToModel<T>(response.data);
  }

  /// get method request return Model List
  Future<List<T>> getModels<T>(String path,
      {Map<String, ResponseBody>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    options ??= Options(responseType: ResponseType.json);
    options.responseType = ResponseType.json;
    var response = await get<dynamic>(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    return dioResultToModels<T>(response.data);
  }

  /// get method request return Stream
  Future<Stream<Uint8List>> getStream(String path,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    options ??= Options(responseType: ResponseType.stream);
    options.responseType = ResponseType.stream;
    var response = await _dio.get<ResponseBody>(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    return response.data!.stream;
  }

  /// get method request return Bytes List<int>
  Future<List<int>> getBytes(String path,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    options ??= Options(responseType: ResponseType.stream);
    options.responseType = ResponseType.bytes;
    var response = await _dio.get<List<int>>(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    return response.data as List<int>;
  }

  /// post
  Future<Response<T>> post<T>(String path,
      {data, Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    options ??= Options(responseType: ResponseType.json);
    options.responseType = ResponseType.json;
    var response = await _dio.post<T>(path,
        data: data,queryParameters: queryParameters,
        options: options,cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return response;
  }

  /// multi Request return Future<List<T>>
  Future<List<T>> multiRequest<T>(Iterable<Future<T>> futures,
      {bool eagerError = false, void Function(T successValue)? cleanUp}) async {
    var response =
    await Future.wait(futures, eagerError: eagerError, cleanUp: cleanUp);
    return response;
  }

  /// downloadFile
  Future<Response<dynamic>> downloadFile(String apiPath, savePath,
      {ProgressCallback? onReceiveProgress,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        bool deleteOnError = true,
        String lengthHeader = Headers.contentLengthHeader,
        data,Options? options,}) async {
    var response = await _dio.download(apiPath, savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,options: options);
    return response;
  }

  /// uploadFiles
  Future<Response<dynamic>> uploadFiles(String apiPath, savePath,
      {ProgressCallback? onReceiveProgress,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        bool deleteOnError = true,
        String lengthHeader = Headers.contentLengthHeader,
        data,Options? options,}) async {
    var response = await _dio.download(apiPath, savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,options: options);
    return response;
  }

  /// postDataByStream
  /// 注意：如果要监听提交进度，则必须设置content-length，否则是可选的。
  Future<Response<T>> postDataByStream<T>(String path,
      {data, Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    options ??= Options(responseType: ResponseType.stream);
    options.responseType = ResponseType.stream;
    var response = await _dio.post<T>(path,
        data: data,queryParameters: queryParameters,
        options: options,cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return response;
  }
}
