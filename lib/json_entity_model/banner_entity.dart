class BannerEntity {
    List<BannerItem> data;
    int code;
    String msg;

    BannerEntity({this.data, this.code, this.msg});

    factory BannerEntity.fromJson(Map<String, dynamic> json) {
        return BannerEntity(
            data: json['data'] != null ? (json['data'] as List).map((i) => BannerItem.fromJson(i)).toList() : null,
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

class BannerItem {
    String des;
    int id;
    String imgPath;
    String mstr;
    String title;
    String urlPath;

    BannerItem({this.des, this.id, this.imgPath, this.mstr, this.title, this.urlPath});

    factory BannerItem.fromJson(Map<String, dynamic> json) {
        return BannerItem(
            des: json['des'],
            id: json['id'],
            imgPath: json['imgPath'],
            mstr: json['mstr'],
            title: json['title'],
            urlPath: json['urlPath'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['des'] = this.des;
        data['id'] = this.id;
        data['imgPath'] = this.imgPath;
        data['mstr'] = this.mstr;
        data['title'] = this.title;
        data['urlPath'] = this.urlPath;
        return data;
    }

    @override
    String toString() {
        return 'BannerItem{des: $des, id: $id, imgPath: $imgPath, mstr: $mstr, title: $title, urlPath: $urlPath}';
    }


}