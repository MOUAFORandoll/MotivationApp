import 'dart:convert';

import 'package:Motivation/utils/api/apiUrl.dart';
import 'package:Motivation/utils/provider/base_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit();
  }

  GetStorage box = GetStorage();

  Future login(String email, String password) async {
    print('******** envoi du login');

    try {
      final response = await dio.post(
        ApiUrl.baseUrl + "/api/logins",
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode(
          {
            "phone": email,
            "password": password,
          },
        ),
      );
      print('****a**** ${response.data}');
      return response.data;
    } catch (e) {
      print('********eroor $e');
      return null;
    }
  }
 
}
