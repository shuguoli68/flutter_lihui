class CommonBoolEntity {
    bool data;
    int code;
    String msg;

    CommonBoolEntity({this.data, this.code, this.msg});

    factory CommonBoolEntity.fromJson(Map<String, dynamic> json) {
        return CommonBoolEntity(
            data: json['data'],
            code: json['code'], 
            msg: json['msg'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['data'] = this.data;
        data['code'] = this.code;
        data['msg'] = this.msg;
        return data;
    }
}