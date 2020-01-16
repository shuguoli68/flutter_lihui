class FootEntity {
    List<FootItem> data;
    int code;
    String msg;

    FootEntity({this.data, this.code, this.msg});

    factory FootEntity.fromJson(Map<String, dynamic> json) {
        return FootEntity(
            data: json['data'] != null ? (json['data'] as List).map((i) => FootItem.fromJson(i)).toList() : null,
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

class FootItem {
    int ctTime;
    int foot;
    int id;
    int strTime;
    String toUserId;
    String userId;

    FootItem({this.ctTime, this.foot, this.id, this.strTime, this.toUserId, this.userId});

    factory FootItem.fromJson(Map<String, dynamic> json) {
        return FootItem(
            ctTime: json['ctTime'],
            foot: json['foot'],
            id: json['id'],
            strTime: json['strTime'],
            toUserId: json['toUserId'],
            userId: json['userId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ctTime'] = this.ctTime;
        data['foot'] = this.foot;
        data['id'] = this.id;
        data['strTime'] = this.strTime;
        data['toUserId'] = this.toUserId;
        data['userId'] = this.userId;
        return data;
    }
}