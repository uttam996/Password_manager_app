

class Logs {
  String? sId;
  String? model;
  String? oldData;
  String? newData;
  String? createdAt;
  String? updatedAt;

  Logs(
      {this.sId,
      this.model,
      this.oldData,
      this.newData,
      this.createdAt,
      this.updatedAt});

  Logs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    model = json['model'];
    oldData = json['old_data'];
    newData = json['new_data'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['model'] = model;
    data['old_data'] = oldData;
    data['new_data'] = newData;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
