import 'package:dio/dio.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'result_data.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) {
    RequestOptions option = response.request;
    try {
      if (option.contentType != null &&
          option.contentType.primaryType == "text") {
        return new ResultData(response.data, true, 200);
      }
      ///一般只需要处理200的情况，300、400、500保留错误信息
      print('receive:'+response.statusCode.toString()+','+response.statusMessage);
      if (response.statusCode == 200) {
        return new ResultData(response.data, true, 200,
            headers: response.headers);
      }else{
        return new ResultData(response.data, false, 404,
            headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + option.path);

      return new ResultData(response.data, false, response.statusCode,
          headers: response.headers);
    }

    return new ResultData(response.data, false, response.statusCode,
        headers: response.headers);
  }
}
