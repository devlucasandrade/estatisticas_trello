import 'package:estatisticas_trello/src/model/labels_model.dart';

class CardModel {
  String id;
  String idList;
  String name;
  String? desc;
  String? shortUrl;
  List<LabelsModel>? labels;

  CardModel({
    required this.id,
    required this.idList,
    required this.name,
    this.desc,
    this.shortUrl,
    this.labels,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json['id'],
        idList: json['idList'],
        name: json['name'],
        desc: json['desc'],
        labels: List<LabelsModel>.from(
          json['labels'].map((x) => LabelsModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idList": idList,
        "name": name,
        "desc": desc,
      };
}
