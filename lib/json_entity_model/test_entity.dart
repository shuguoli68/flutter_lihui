class TestEntity {
	String noFirstChar;
	List<TestArtist> artist;
	int havemore;
	int nums;

	TestEntity({this.noFirstChar, this.artist, this.havemore, this.nums});

	TestEntity.fromJson(Map<String, dynamic> json) {
		noFirstChar = json['noFirstChar'];
		if (json['artist'] != null) {
			artist = new List<TestArtist>();(json['artist'] as List).forEach((v) { artist.add(new TestArtist.fromJson(v)); });
		}
		havemore = json['havemore'];
		nums = json['nums'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['noFirstChar'] = this.noFirstChar;
		if (this.artist != null) {
      data['artist'] =  this.artist.map((v) => v.toJson()).toList();
    }
		data['havemore'] = this.havemore;
		data['nums'] = this.nums;
		return data;
	}
}

class TestArtist {
	String area;
	String country;
	int islocate;
	String piaoId;
	String gender;
	String albumsTotal;
	String avatarBig;
	String avatarMiddle;
	String avatarSmall;
	String artistId;
	String firstchar;
	String isYyr;
	String avatarMini;
	String songsTotal;
	String name;
	String tingUid;

	TestArtist({this.area, this.country, this.islocate, this.piaoId, this.gender, this.albumsTotal, this.avatarBig, this.avatarMiddle, this.avatarSmall, this.artistId, this.firstchar, this.isYyr, this.avatarMini, this.songsTotal, this.name, this.tingUid});

	TestArtist.fromJson(Map<String, dynamic> json) {
		area = json['area'];
		country = json['country'];
		islocate = json['islocate'];
		piaoId = json['piao_id'];
		gender = json['gender'];
		albumsTotal = json['albums_total'];
		avatarBig = json['avatar_big'];
		avatarMiddle = json['avatar_middle'];
		avatarSmall = json['avatar_small'];
		artistId = json['artist_id'];
		firstchar = json['firstchar'];
		isYyr = json['is_yyr'];
		avatarMini = json['avatar_mini'];
		songsTotal = json['songs_total'];
		name = json['name'];
		tingUid = json['ting_uid'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['area'] = this.area;
		data['country'] = this.country;
		data['islocate'] = this.islocate;
		data['piao_id'] = this.piaoId;
		data['gender'] = this.gender;
		data['albums_total'] = this.albumsTotal;
		data['avatar_big'] = this.avatarBig;
		data['avatar_middle'] = this.avatarMiddle;
		data['avatar_small'] = this.avatarSmall;
		data['artist_id'] = this.artistId;
		data['firstchar'] = this.firstchar;
		data['is_yyr'] = this.isYyr;
		data['avatar_mini'] = this.avatarMini;
		data['songs_total'] = this.songsTotal;
		data['name'] = this.name;
		data['ting_uid'] = this.tingUid;
		return data;
	}
}
