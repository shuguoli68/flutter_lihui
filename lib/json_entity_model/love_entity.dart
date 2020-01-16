class LoveEntity {
    List<LoveItem> data;
    int code;
    String msg;

    LoveEntity({this.data, this.code, this.msg});

    factory LoveEntity.fromJson(Map<String, dynamic> json) {
        return LoveEntity(
            data: json['data'] != null ? (json['data'] as List).map((i) => LoveItem.fromJson(i)).toList() : null,
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

class LoveItem {
    int ctTime;
    int id;
    int love;
    String toUserId;
    String userId;
    int utTime;

    LoveItem({this.ctTime, this.id, this.love, this.toUserId, this.userId, this.utTime});

    factory LoveItem.fromJson(Map<String, dynamic> json) {
        return LoveItem(
            ctTime: json['ctTime'],
            id: json['id'],
            love: json['love'],
            toUserId: json['toUserId'],
            userId: json['userId'],
            utTime: json['utTime'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ctTime'] = this.ctTime;
        data['id'] = this.id;
        data['love'] = this.love;
        data['toUserId'] = this.toUserId;
        data['userId'] = this.userId;
        data['utTime'] = this.utTime;
        return data;
    }
}