import 'package:dio/dio.dart';
import 'package:flutter_application/infrastructure/models/user.dart';
import 'package:flutter_application/repositories/user_repository.dart';

import '../infrastructure/models/grupo.dart';
import '../infrastructure/models/in_box.dart';
import '../infrastructure/models/ticket.dart';
import '../utils/constants.dart';
import 'inBox_repository.dart';

class InBoxRespositoryImpl extends InBoxRespository {
  String path = '${Constants.apiUrl}/inBox';

  @override
  Future<InBox> sendInBox(var inBox) async {
    var response = await Dio().post(path, data: inBox);

    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }

    return InBox.fromJson(response.data);
  }

  @override
  Future<List<InBox>> recibeInBox(String idUsuer) async {
    var response = await Dio().get("$path/$idUsuer");
    if (response.statusCode == 200) {
      List<InBox> listInBox = [];
      for (var item in response.data) {
        listInBox.add(InBox.fromJson(item));
      }
      return listInBox;
    } else {
      throw Exception('Failed to register user');
    }
  }
}
