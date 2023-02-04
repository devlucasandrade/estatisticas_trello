import 'package:estatisticas_trello/src/model/list_model.dart';

class BoardModel {
  String id;
  List<ListModel>? listModel;

  BoardModel({
    required this.id,
    required this.listModel,
  });

  factory BoardModel.fromJson(Map<String, dynamic> json) => BoardModel(
        id: json['id'],
        listModel: List<ListModel>.from(
          json['listModel'].map((x) => ListModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "listModel": List<dynamic>.from(listModel!.map((e) => e.toJson()))
      };
}
