class DiaryEntity {
    List<DiaryItem> data;
    int code;
    String msg;

    DiaryEntity({this.data, this.code, this.msg});

    factory DiaryEntity.fromJson(Map<String, dynamic> json) {
        return DiaryEntity(
            data: json['data'] != null ? (json['data'] as List).map((i) => DiaryItem.fromJson(i)).toList() : null,
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

class DiaryItem {
    String content;
    int ctTime;
    String diaryId;
    List<DiaryTag> diaryTags;
    List<DiaryTheme> diaryThemes;
    int subTheme;
    String tagId;
    int theme;
    String title;
    String userId;
    int utTime;

    DiaryItem({this.content, this.ctTime, this.diaryId, this.diaryTags, this.diaryThemes, this.subTheme, this.tagId, this.theme, this.title, this.userId, this.utTime});

    factory DiaryItem.fromJson(Map<String, dynamic> json) {
        return DiaryItem(
            content: json['content'],
            ctTime: json['ctTime'],
            diaryId: json['diaryId'],
            diaryTags: json['diaryTags'] != null ? (json['diaryTags'] as List).map((i) => DiaryTag.fromJson(i)).toList() : null,
            diaryThemes: json['diaryThemes'] = null,//!= null ? (json['diaryThemes'] as List).map((i) => DiaryTheme.fromJson(i)).toList() : null,
            subTheme: json['subTheme'],
            tagId: json['tagId'],
            theme: json['theme'],
            title: json['title'],
            userId: json['userId'],
            utTime: json['utTime'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['content'] = this.content;
        data['ctTime'] = this.ctTime;
        data['diaryId'] = this.diaryId;
        data['subTheme'] = this.subTheme;
        data['tagId'] = this.tagId;
        data['theme'] = this.theme;
        data['title'] = this.title;
        data['userId'] = this.userId;
        data['utTime'] = this.utTime;
        if (this.diaryTags != null) {
            data['diaryTags'] = this.diaryTags.map((v) => v.toJson()).toList();
        }
        if (this.diaryThemes != null) {
            data['diaryThemes'] = null;//this.diaryThemes.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class DiaryTag {
    int id;
    String tagId;
    String tagStr;

    DiaryTag({this.id, this.tagId, this.tagStr});

    factory DiaryTag.fromJson(Map<String, dynamic> json) {
        return DiaryTag(
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

class DiaryTheme {
    int id;
    String themeId;
    String themeName;
    List<DiarySubTheme> subThemes;

    DiaryTheme({this.id, this.themeId, this.themeName, this.subThemes});

    factory DiaryTheme.fromJson(Map<String, dynamic> json) {
        return DiaryTheme(
            id: json['id'],
            themeId: json['themeId'],
            themeName: json['themeName'],
            subThemes: json['subThemes'] != null ? (json['subThemes'] as List).map((i) => DiarySubTheme.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['themeId'] = this.themeId;
        data['themeName'] = this.themeName;
        if (this.subThemes != null) {
            data['diaryThemes'] = this.subThemes.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class DiarySubTheme {
    int id;
    String subThemeId;
    String subThemeName;
    String themeId;

    DiarySubTheme({this.id, this.subThemeId, this.subThemeName, this.themeId});

    factory DiarySubTheme.fromJson(Map<String, dynamic> json) {
        return DiarySubTheme(
            id: json['id'],
            subThemeId: json['subThemeId'],
            subThemeName: json['subThemeName'],
            themeId: json['themeId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['subThemeId'] = this.subThemeId;
        data['subThemeName'] = this.subThemeName;
        data['themeId'] = this.themeId;
        return data;
    }
}