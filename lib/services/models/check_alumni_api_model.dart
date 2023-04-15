class CheckAlumniApiModel {
  int? statusCode;
  String? message;
  Data? data;

  CheckAlumniApiModel({this.statusCode, this.message, this.data});

  CheckAlumniApiModel.fromJson(Map<String, dynamic> json) {
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
  FinalResponse? finalResponse;

  Data({this.finalResponse});

  Data.fromJson(Map<String, dynamic> json) {
    finalResponse = json['finalResponse'] != null
        ? new FinalResponse.fromJson(json['finalResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.finalResponse != null) {
      data['finalResponse'] = this.finalResponse!.toJson();
    }
    return data;
  }
}

class FinalResponse {
  String? requestNumber;
  String? name;
  String? alumnicode;
  String? message;
  String? result;

  FinalResponse(
      {this.requestNumber,
      this.name,
      this.alumnicode,
      this.message,
      this.result});

  FinalResponse.fromJson(Map<String, dynamic> json) {
    requestNumber = json['requestNumber'];
    name = json['name'];
    alumnicode = json['alumnicode'];
    message = json['message'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestNumber'] = this.requestNumber;
    data['name'] = this.name;
    data['alumnicode'] = this.alumnicode;
    data['message'] = this.message;
    data['result'] = this.result;
    return data;
  }
}
