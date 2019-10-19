class UserEntity {
	String msg;
	int code;
	UserData data;

	UserEntity({this.msg, this.code, this.data});

	UserEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
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

class UserData {
	String passWord;
	int ctTime;
	String phone;
	int sex;
	List<UserDataDiary> diarys;
	String userId;
	int utTime;
	int age;

	UserData({this.passWord, this.ctTime, this.phone, this.sex, this.diarys, this.userId, this.utTime, this.age});

	UserData.fromJson(Map<String, dynamic> json) {
		passWord = json['passWord'];
		ctTime = json['ctTime'];
		phone = json['phone'];
		sex = json['sex'];
		if (json['diarys'] != null) {
			diarys = new List<UserDataDiary>();(json['diarys'] as List).forEach((v) { diarys.add(new UserDataDiary.fromJson(v)); });
		}
		userId = json['userId'];
		utTime = json['utTime'];
		age = json['age'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['passWord'] = this.passWord;
		data['ctTime'] = this.ctTime;
		data['phone'] = this.phone;
		data['sex'] = this.sex;
		if (this.diarys != null) {
      data['diarys'] =  this.diarys.map((v) => v.toJson()).toList();
    }
		data['userId'] = this.userId;
		data['utTime'] = this.utTime;
		data['age'] = this.age;
		return data;
	}
}

class UserDataDiary {
	List<Null> diaryTags;
	int subTheme;
	int ctTime;
	String diaryId;
	int theme;
	String title;
	int utTime;
	String userId;
	String content;

	UserDataDiary({this.diaryTags, this.subTheme, this.ctTime, this.diaryId, this.theme, this.title, this.utTime, this.userId, this.content});

	UserDataDiary.fromJson(Map<String, dynamic> json) {
		if (json['diaryTags'] != null) {
			diaryTags = new List<Null>();
		}
		subTheme = json['subTheme'];
		ctTime = json['ctTime'];
		diaryId = json['diaryId'];
		theme = json['theme'];
		title = json['title'];
		utTime = json['utTime'];
		userId = json['userId'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.diaryTags != null) {
      data['diaryTags'] =  [];
    }
		data['subTheme'] = this.subTheme;
		data['ctTime'] = this.ctTime;
		data['diaryId'] = this.diaryId;
		data['theme'] = this.theme;
		data['title'] = this.title;
		data['utTime'] = this.utTime;
		data['userId'] = this.userId;
		data['content'] = this.content;
		return data;
	}
}
