class PublishEntity {
	String msg;
	int code;
	PublishData data;

	PublishEntity({this.msg, this.code, this.data});

	PublishEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new PublishData.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		return data;
	}
}

class PublishData {
	String topId;
	int num;
	String liuserId;
	String title;
	String content;

	PublishData({this.topId, this.num, this.liuserId, this.title, this.content});

	PublishData.fromJson(Map<String, dynamic> json) {
		topId = json['topId'];
		num = json['num'];
		liuserId = json['liuser_id'];
		title = json['title'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['topId'] = this.topId;
		data['num'] = this.num;
		data['liuser_id'] = this.liuserId;
		data['title'] = this.title;
		data['content'] = this.content;
		return data;
	}
}
