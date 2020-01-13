class FileEntity {
    String fileName;
    String filePath;
    String fileType;
    int size;

    FileEntity({this.fileName, this.filePath, this.fileType, this.size});

    factory FileEntity.fromJson(Map<String, dynamic> json) {
        return FileEntity(
            fileName: json['fileName'], 
            filePath: json['filePath'], 
            fileType: json['fileType'], 
            size: json['size'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['fileName'] = this.fileName;
        data['filePath'] = this.filePath;
        data['fileType'] = this.fileType;
        data['size'] = this.size;
        return data;
    }
}