class LoginEntity {
	String msg;
	int code;
	LoginData data;

	LoginEntity({this.msg, this.code, this.data});

	LoginEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
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

class LoginData {
	String passWord;
	int ctTime;
	String phone;
	String name;
	int sex;
	List<LoginDataDiary> diarys;
	String userId;
	int utTime;
	int age;

	LoginData({this.passWord, this.ctTime, this.phone, this.name, this.sex, this.diarys, this.userId, this.utTime, this.age});

	LoginData.fromJson(Map<String, dynamic> json) {
		passWord = json['passWord'];
		ctTime = json['ctTime'];
		phone = json['phone'];
		name = json['name'];
		sex = json['sex'];
		if (json['diarys'] != null) {
			diarys = new List<LoginDataDiary>();(json['diarys'] as List).forEach((v) { diarys.add(new LoginDataDiary.fromJson(v)); });
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
		data['name'] = this.name;
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

class LoginDataDiary {
	List<LoginDataDiarysDiarytag> diaryTags;
	int subTheme;
	int ctTime;
	String tagId;
	String diaryId;
	List<Null> diaryThemes;
	int theme;
	String title;
	int utTime;
	String userId;
	String content;

	LoginDataDiary({this.diaryTags, this.subTheme, this.ctTime, this.tagId, this.diaryId, this.diaryThemes, this.theme, this.title, this.utTime, this.userId, this.content});

	LoginDataDiary.fromJson(Map<String, dynamic> json) {
		if (json['diaryTags'] != null) {
			diaryTags = new List<LoginDataDiarysDiarytag>();(json['diaryTags'] as List).forEach((v) { diaryTags.add(new LoginDataDiarysDiarytag.fromJson(v)); });
		}
		subTheme = json['subTheme'];
		ctTime = json['ctTime'];
		tagId = json['tagId'];
		diaryId = json['diaryId'];
		if (json['diaryThemes'] != null) {
			diaryThemes = new List<Null>();
		}
		theme = json['theme'];
		title = json['title'];
		utTime = json['utTime'];
		userId = json['userId'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.diaryTags != null) {
      data['diaryTags'] =  this.diaryTags.map((v) => v.toJson()).toList();
    }
		data['subTheme'] = this.subTheme;
		data['ctTime'] = this.ctTime;
		data['tagId'] = this.tagId;
		data['diaryId'] = this.diaryId;
		if (this.diaryThemes != null) {
      data['diaryThemes'] =  [];
    }
		data['theme'] = this.theme;
		data['title'] = this.title;
		data['utTime'] = this.utTime;
		data['userId'] = this.userId;
		data['content'] = this.content;
		return data;
	}
}

class LoginDataDiarysDiarytag {
	String tagId;
	int id;
	String tagStr;

	LoginDataDiarysDiarytag({this.tagId, this.id, this.tagStr});

	LoginDataDiarysDiarytag.fromJson(Map<String, dynamic> json) {
		tagId = json['tagId'];
		id = json['id'];
		tagStr = json['tagStr'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['tagId'] = this.tagId;
		data['id'] = this.id;
		data['tagStr'] = this.tagStr;
		return data;
	}
}
