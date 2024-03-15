class Password {
  String? sId;
  String? password;
  String? userName;
  String? webSiteName;
  String? createdAt;
  String? updatedAt;

  Password(
      {this.sId,
      this.password,
      this.userName,
      this.webSiteName,
     
      this.createdAt,
      this.updatedAt});

  Password.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    password = json['password'];
    userName = json['userName'];
    webSiteName = json['webSiteName'];
    
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['password'] = password;
    data['UserName'] = userName;
    data['website'] = webSiteName;
  
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}