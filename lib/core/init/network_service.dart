import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:real_mert_album/core/consts/end_points.dart';
import 'package:real_mert_album/core/consts/local_storage.dart';
import 'package:real_mert_album/core/init/exceptions.dart';
import 'package:real_mert_album/data/model/user_model.dart';

class NetworkService {
  get({endPoint, token}) async {
    try {
      var response =
          await http.get(Uri.parse(EndPoints.baseUrl + endPoint), headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer ${token ?? LocalStorage.appToken}'
      });
      return returnResponse(response);
    } on SocketException {
      throw const SocketException('No Internet Connection');
    } on FormatException {
      throw const FormatException('Bad Format');
    }
  }

  post({endPoint, token, body}) async {
    try {
      var response = await http.post(
        Uri.parse(EndPoints.baseUrl + endPoint),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer ${token ?? LocalStorage.appToken}'
        },
        body: json.encode(body),
      );
      return returnResponse(response);
    } on SocketException {
      throw const SocketException('No Internet| You don\'t have a connection');
    } on FormatException {
      throw const FormatException('Bad Format');
    }
  }

  returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var data = json.decode(response.body);
        return data;
      case 400:
        // türkçe karakter sorunu için utf8.decode
        throw BadRequestException(utf8.decode(response.bodyBytes));
      case 401:
        throw UnauthorisedException(utf8.decode(response.bodyBytes));
    }
  }
}
