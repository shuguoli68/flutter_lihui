class AccountEntity {
	String msg;
	int code;
	AccountData data;

	AccountEntity({this.msg, this.code, this.data});

	AccountEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new AccountData.fromJson(json['data']) : null;
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

class AccountData {
	String passWord;
	int ctTime;
	String phone;
	int sex;
	List<Null> diarys;
	String userId;
	int utTime;
	int age;

	AccountData({this.passWord, this.ctTime, this.phone, this.sex, this.diarys, this.userId, this.utTime, this.age});

	AccountData.fromJson(Map<String, dynamic> json) {
		passWord = json['passWord'];
		ctTime = json['ctTime'];
		phone = json['phone'];
		sex = json['sex'];
		if (json['diarys'] != null) {
			diarys = new List<Null>();
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
      data['diarys'] =  [];
    }
		data['userId'] = this.userId;
		data['utTime'] = this.utTime;
		data['age'] = this.age;
		return data;
	}
}
