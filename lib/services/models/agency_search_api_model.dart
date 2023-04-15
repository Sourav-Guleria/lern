class AgencySearchApiModel {
  int? statusCode;
  String? message;
  Data? data;

  AgencySearchApiModel({this.statusCode, this.message, this.data});

  AgencySearchApiModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<MasterRecords>? masterRecords;

  Data({this.masterRecords});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['masterRecords'] != null) {
      masterRecords = <MasterRecords>[];
      json['masterRecords'].forEach((v) {
        masterRecords!.add(new MasterRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.masterRecords != null) {
      data['masterRecords'] =
          this.masterRecords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MasterRecords {
  String? name;
  String? description;

  MasterRecords({this.name, this.description});

  MasterRecords.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
