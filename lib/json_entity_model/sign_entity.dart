class SignEntity {
    List<SignItem> data;
    int code;
    String msg;

    SignEntity({this.data, this.code, this.msg});

    factory SignEntity.fromJson(Map<String, dynamic> json) {
        return SignEntity(
            data: json['data'] != null ? (json['data'] as List).map((i) => SignItem.fromJson(i)).toList() : null,
            code: json['code'], 
            msg: json['msg'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['msg'] = this.msg;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class SignItem {
    int ctTime;
    int id;
    String strTime;
    String userId;

    SignItem({this.ctTime, this.id, this.strTime, this.userId});

    factory SignItem.fromJson(Map<String, dynamic> json) {
        return SignItem(
            ctTime: json['ctTime'],
            id: json['id'],
            strTime: json['strTime'],
            userId: json['userId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ctTime'] = this.ctTime;
        data['id'] = this.id;
        data['strTime'] = this.strTime;
        data['userId'] = this.userId;
        return data;
    }
}