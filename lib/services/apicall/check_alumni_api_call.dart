import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as https;
import 'package:alumni_verification_form/services/models/check_alumni_api_model.dart';

class CheckAlumniApiCall {
  CheckAlumniApiCall(
      {required this.agencyName,
      required this.employeeCode,
      required this.dob});
  String? agencyName;
  String? employeeCode;
  String? dob;

  Future<CheckAlumniApiModel?> fetchData() async {
    try {
      var responce = await https.get(Uri.parse(
          'https://dev.swayam.jio.com:3008/avp/api/v1/alumni/alumnicheck?agencyclient=$agencyName&alumniCode=$employeeCode&dateofbirth=$dob'));
      print(responce.statusCode);
      if (responce.statusCode == 200) {
        var jsonString = responce.body;
        print(responce.body);
        var decodedData =
            CheckAlumniApiModel.fromJson(jsonDecode(responce.body));

        return decodedData;
      } else {
        print('Request failed with status: ${responce.statusCode}');
      }
      return null;
    } catch (e) {
      log(e.toString());
    }
  }
}
