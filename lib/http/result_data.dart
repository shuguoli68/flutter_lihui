
class ResultData {
  var data;
  bool isSuccess;
  int code;
  var headers;

  ResultData(this.data, this.isSuccess, this.code, {this.headers});
}

class ResultError{
  var e;

  ResultError(this.e){
    print('ResultError:');
    print(e);
  }
}