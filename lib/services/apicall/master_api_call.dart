import 'dart:convert';
import 'dart:developer';

import 'package:alumni_verification_form/services/models/master_api_model.dart';
import 'package:http/http.dart' as https;

class MasterApiCall {
  MasterApiCall({
    required this.masterName,
    required this.query,
  });
  String? masterName;
  String? query;
  Future<MasterApiModel?> fetchData() async {
    try {
      var headers = {
        'authorization':
            'Bearer 53616c7465645f5fbbbb1f3dca184a940bfd1dc5894142d239594efbf474154a90d85203e012ae58295e9100621d5527022cac3e0cbe4bd1ab2aeece19132f5fac8f4015d7b1b768c8ae6e27bdca7badff78271ab99a3eb5a2208b8a573426c4841cc25d793563db3d5bc8782c8dcd1f7c0dfeefc39438039d4ba536fab15985c0da8783c4104503e1d070b1a426fe2a20149c834a2c2e5db9e46af6e63bc01a1acc6d7565f06cf90d2d8c3a33b29c47b48c0f29e7f146c7ecd72bbbbeca5b2ffb4b84d113c418e37776dbfe18e13c2a5fd09ba7ae5602891e2bd4c6d00c910c4ae01be30e2bce3c625340c4f476c1c4a3b0f9447629ad1312125ba28060706e466174b023609ec4987f8c76b785b089ec51fa1e2e6d272339bcd94d80e670a4faaa950d2771238afabc7b43505f5ad3e1815c85969af9e1bac408cdcbc9f3bcf11b59a9b9bb9f2b73d00878b208cb06f25ff77d03d89d13a0e3a79f353d92de16bcf8ab823af10fbe1c897f29baba826381a78bd3d62a0f09c6c22668b3ab1c89f96778c7956366d51c5f8ec7d74d043a7f8eee6dedcc414a1ce25f953a0ce9705b5399df6187522e986d2a760a12f573f9a277f4fa3233a7fba7cb849ef781eaef19be1072533712dbcdca51fc11144c68f5e22892dcf0c3f35c95bbe54c55978422d7eb32a7daf4078330f8cc9e2e2a27f6b4f465c280d84c96e901b18645a0a85287331a34d9abe51e2f175e6fb10ffb6eba3ef6e30008337f58883faaa1347c8e9109558f2a2d99a3763467c4264e366da827f7848093a6f37c371e17b2c942848d7866d4e91c940ba30e0d233444dc80d6ccc8e58072712909a5cfe75e56b7ceea80d9d7d081f683f19f84d2ed39e23502b39ac0fb5937a0055659c263cf3fe6ad1b0481e38e101a8333efbcef80e1d547ba50fc6287e37da78fd367aa9100d3fd26d3ff20d2f3e208d67170b256990773fa3183332cd899692840fc5f2b6d1c6ee7520119fd72ec077d316eb87150452777b0ef8731afbdd76420535762ff464ea163de1f663ddce9ddfd4d1f6279425b16257f102c08f4e42da021ac86f850d0cbd30b51b6bd4c27e4f4b56a6d07c2030266f65540f6bb815de87f3e4157b3b661262ef602334e1fa7b00ddf6444ccd0848c227d80f4940a8e567aeb7a71bb1b36183f9cfb741353b1bdf09b729af96c91bce4f7da9480cc054d37afb7c14240ab63ba82c07b8d8c80af88d5e3947d193462f8dcc0511ebfae865be5a16d5fbd8c651adc77b9319d28c9c5c4fe109944f4ae4a1316a8da6d2de6f88fdc6159cc62eeb7ae0942eec2123c4666'
      };
      var responce = await https.get(Uri.parse(
          "https://dev.swayam.jio.com:3008/avp/api/v1/alumni/master?masterName=$masterName&q=$query"));

      responce.headers.addAll(headers);
      print(responce.statusCode);
      if (responce.statusCode == 200) {
        var jsonString = responce.body;

        var decodedData = MasterApiModel.fromJson(jsonDecode(responce.body));

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
