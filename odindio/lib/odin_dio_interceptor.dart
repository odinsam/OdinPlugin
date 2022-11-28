import 'package:dio/dio.dart';

class OdinDioInterceptor extends Interceptor {
  OdinDioInterceptor({
    this.onRequestHandler,
    this.onResponseHandler,
    this.onErrorHandler,
  });
  Function(RequestOptions options, RequestInterceptorHandler handler)? onRequestHandler;
  Function(Response response, ResponseInterceptorHandler handler)? onResponseHandler;
  Function(DioError err, ErrorInterceptorHandler handler)? onErrorHandler;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(onRequestHandler!=null){
      onRequestHandler!(options,handler);
    }
    return super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if(onResponseHandler!=null){
      onResponseHandler!(response,handler);
    }
    super.onResponse(response, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if(onErrorHandler!=null){
      onErrorHandler!(err,handler);
    }
    super.onError(err, handler);
  }
}