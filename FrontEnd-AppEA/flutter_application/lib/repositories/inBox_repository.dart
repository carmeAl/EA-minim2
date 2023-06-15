import '../infrastructure/models/in_box.dart';

abstract class InBoxRespository {
  Future<InBox> sendInBox(var inBox);
  Future<List<InBox>> recibeInBox(String idUsuer);
}
