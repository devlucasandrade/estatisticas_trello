// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:estatisticas_trello/src/model/list_model.dart';

class BoardModel {
  String id;
  String name;
  List<ListModel>? listModel;

  BoardModel({
    required this.id,
    required this.name,
    this.listModel,
  });

  factory BoardModel.fromJson(Map<String, dynamic> json) => BoardModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "listModel": List<dynamic>.from(listModel!.map((e) => e.toJson()))
      };
}
