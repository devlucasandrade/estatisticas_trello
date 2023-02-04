class LabelsModel {
  String id;
  String? idBoard;
  String name;
  String? color;

  LabelsModel({
    required this.id,
    this.idBoard,
    required this.name,
    this.color,
  });

  factory LabelsModel.fromJson(Map<String, dynamic> json) => LabelsModel(
        id: json['id'],
        idBoard: json['idBoard'],
        name: json['name'],
        color: json['color'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idBoard": idBoard,
        "name": name,
        "color": color,
      };
}
