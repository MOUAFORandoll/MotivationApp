import 'dart:convert';
import 'dart:io';

import 'package:Motivation/model/data/AbonnementModel.dart';
import 'package:Motivation/model/data/CommentModel%20.dart';
import 'package:Motivation/model/data/LikeModel.dart';
import 'package:Motivation/model/data/MessageModel.dart';
import 'package:Motivation/model/data/PartageModel.dart';
import 'package:Motivation/model/data/PublicationModel.dart';
import 'package:Motivation/model/data/SaveModel.dart';
import 'package:Motivation/model/data/TypePublicationModel.dart';
import 'package:Motivation/model/data/UserModel.dart';
import 'package:Motivation/utils/api/apiUrl.dart';
import 'package:Motivation/utils/provider/refresh_token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class ApiService {
  static Dio dio = Dio(
    BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {
      "Accept": "application/json",
    }),
  );
  GetStorage box = GetStorage();
/*   var api = ApiService(); */

  static getPublications() async {
    // var dio = await CustomDio().getApiClient();

    try {
      List<PublicationModel> responseWModel;
      Response response = await dio.get("/api/publications");
      if (response.statusCode == 200 || response.statusCode == 201) {
        responseWModel = (response.data as List)
            .map((e) => PublicationModel.fromJson(e))
            .toList();
      } else {
        responseWModel = [];
      }

      return responseWModel;
    } on SocketException {
      throw Exception("No Internet Connexion");
    }
  }

  static getUsers() async {
    // var dio = await CustomDio().getApiClient();

    try {
      List<UserModel> responseWModel;
      Response response = await dio.get("/api/users");
      if (response.statusCode == 200 || response.statusCode == 201) {
        responseWModel =
            (response.data as List).map((e) => UserModel.fromJson(e)).toList();
      } else {
        responseWModel = [];
      }

      return responseWModel;
    } on SocketException {
      throw Exception("No Internet Connexion");
    }
  }

  static getDatas(String url, var eltmodel) async {
    var dio = await CustomDio().getApiClient();

    try {
      Response response = await dio.get("$url");

      return returnListResponseGet(response, eltmodel);
    } on SocketException {
      throw Exception("No Internet Connexion");
    }
  }

  static checkResponseType(var model) {
    switch (model) {

      ///case value is the element type with return in the selected model
      case AbonnementModel:

        ///the return of selected model data who user get
        return AbonnementModel;

      case CommentModel:
        return CommentModel;
      case LikesModel:
        return LikesModel;
      case AbonnementModel:
        return AbonnementModel;
      case MessageModel:
        return MessageModel;
      case PartageModel:
        return PartageModel;
      case PublicationModel:
        return PublicationModel;
      case SaveModel:
        return SaveModel;
      case TypePublicationModel:
        return TypePublicationModel;
      case UserModel:
        return UserModel;

      default:
    }
  }

  static returnListResponseGet(Response response, var eltmodel) {
    var model = checkResponseType(eltmodel);

    switch (response.statusCode) {
      case 200:
      // dynamic responseWModel =
      //     (response.data as List).map((e) => model.fromJson(e)).toList();
      // return responseWModel;
      case 201:
        dynamic responseWModel =
            (response.data as List).map((e) => model.fromJson(e)).toList();
        return responseWModel;
      case 400:
        throw Exception(response.data.toString());
      case 401:
      case 403:
        return CustomDio().refreshToken();
      case 500:
        throw Exception("INternal server problems try later");

      default:
    }
  }

  getOne(String url, var model) async {
    var dio = await CustomDio().getApiClient();

    try {
      Response response = await dio.get("$url");

      print("fin du get unique de $model statut code: ${response.statusCode}");
      return returnResponseGet(response, model);
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  returnResponseGet(Response response, var eltmodel) {
    var model = checkResponseType(eltmodel);
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseWModel = model.fromJson((response.data));
        return responseWModel;
      case 400:
        throw Exception(response.data.toString());
      case 401:
      case 403:
        return CustomDio().refreshToken();
      case 500:
        throw Exception("Internal server problems try later");
        break;
      default:
    }
  }

  postData(String url, var data) async {
    // var dio = await CustomDio().getApiClient();

    try {
      print("debut du poast de donnee dont les datas sont $data");

      Response response = await dio.post("$url", data: data);

      print("fin du post de donnees $data statut code: ${response.statusCode}");
      return returnResponsePost(response);
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  returnResponsePost(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseWModel = response.data;
        return responseWModel;
      case 400:
        throw Exception(response.data.toString());
      case 401:
      case 403:
        return CustomDio().refreshToken();
      case 500:
        throw Exception("Internal server problems try later");
        break;
      default:
    }
  }

  loginUser(var data) async {
    Dio _dio = Dio(
      BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {
        "Accept": "application/json",
      }),
    );
    try {
      print("debut du login de l'utilisateur dont les datas sont $data");

      Response response = await _dio.post("/api/logins", data: data);
      print(
          "fin du login de l'utilisateur de donnees $data statut code: ${response.statusCode}");

      print(
        data,
      );

      return response.data;
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  patchData(String url, data) async {
    Dio _dioPatch = Dio();
    _dioPatch.options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
    );
    print(
        "Debut du patch d'informations suivantes $data a l\'url ${ApiUrl.baseUrl}+ /$url");
    var patcInformation = await _dioPatch.patch("$url",
        options: Options(headers: {
          "content-Type": "application/merge-patch+json",
          /*    "Authorization":
                                                    "Bearer ${response.data['token']}" */
        }, contentType: "application/merge-patch+json"),
        data: jsonEncode(data));
    print("Debut du patch d'informations");
    return returnResponsePatch(patcInformation);
  }

  returnResponsePatch(Response response) {
    switch (response.statusCode) {
      case 204:
        dynamic responseWModel = jsonDecode(response.data);
        return responseWModel;
      case 400:
        throw Exception(response.data.toString());
      case 401:
      case 403:
        return CustomDio().refreshToken();
      case 500:
        throw Exception("Internal server problems try later");

      default:
    }
  }

  Future downlaodAndSaveToStorage(
      context, String urlPath, String fileName, String finalPath) async {
    Directory d = Directory(finalPath);

    try {
      final file = File('${d.path}/$fileName.mp3');
      print('${d.path}/$fileName.mp3');
      await Dio().download(
        "${ApiUrl.baseUrl}" + urlPath,
        file.path,
        onReceiveProgress: (rec, total) {
          /*  setState(() {
         var    progressDowloading = ((rec / total) * 100).toStringAsFixed(0) + "%";
            print(progressDowloading);
            progress.update(message: "svp veillez patienter ");
          }); */
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static verifconnexion(context) async {
    //  print("You don't have network connection!");
    return Toast.show(
      "Verifiez votre connexion internet",
      context,
      backgroundColor: Colors.red[300],
      duration: 4,
      gravity: Toast.BOTTOM,
    );
  }
}
