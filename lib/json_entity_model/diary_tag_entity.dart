class DiaryTagEntity {
    List<TagItem> data;
    int code;
    String msg;

    DiaryTagEntity({this.data, this.code, this.msg});

    factory DiaryTagEntity.fromJson(Map<String, dynamic> json) {
        return DiaryTagEntity(
            data: json['data'] != null ? (json['data'] as List).map((i) => TagItem.fromJson(i)).toList() : null,
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


class TagItem {
    int id;
    String tagId;
    String tagStr;
//    bool select=false;

    TagItem({this.id, this.tagId, this.tagStr/*,this.select*/});

    factory TagItem.fromJson(Map<String, dynamic> json) {
        return TagItem(
            id: json['id'],
            tagId: json['tagId'],
            tagStr: json['tagStr'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['tagId'] = this.tagId;
        data['tagStr'] = this.tagStr;
        return data;
    }


}