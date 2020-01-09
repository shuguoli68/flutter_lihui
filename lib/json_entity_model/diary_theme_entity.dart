class DiaryThemeEntity {
    List<Theme> data;
    int code;
    String msg;

    DiaryThemeEntity({this.data, this.code, this.msg});

    factory DiaryThemeEntity.fromJson(Map<String, dynamic> json) {
        return DiaryThemeEntity(
            data: json['data'] != null ? (json['data'] as List).map((i) => Theme.fromJson(i)).toList() : null,
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

class Theme {
    int id;
    List<SubTheme> subThemes;
    int themeId;
    String themeName;

    Theme({this.id, this.subThemes, this.themeId, this.themeName});

    factory Theme.fromJson(Map<String, dynamic> json) {
        return Theme(
            id: json['id'],
            subThemes: json['subThemes'] != null ? (json['subThemes'] as List).map((i) => SubTheme.fromJson(i)).toList() : null,
            themeId: json['themeId'],
            themeName: json['themeName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['themeId'] = this.themeId;
        data['themeName'] = this.themeName;
        if (this.subThemes != null) {
            data['subThemes'] = this.subThemes.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class SubTheme {
    int id;
    int subThemeId;
    String subThemeName;
    int themeId;

    SubTheme({this.id, this.subThemeId, this.subThemeName, this.themeId});

    factory SubTheme.fromJson(Map<String, dynamic> json) {
        return SubTheme(
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