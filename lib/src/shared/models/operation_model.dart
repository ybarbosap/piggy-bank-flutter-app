import 'dart:convert';

class OperationModel {
  OperationModel({
    this.id,
    this.value,
    this.type,
    this.date,
    this.piggy_bank_id,
  });

  int id;
  double value;
  String type;
  String date;
  int piggy_bank_id;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'type': type,
      'date': date,
      'piggy_bank_id': piggy_bank_id,
    };
  }

  factory OperationModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OperationModel(
      id: map['id'],
      value: map['value'],
      type: map['type'],
      date: map['date'],
      piggy_bank_id: map['piggy_bank_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OperationModel.fromJson(String source) =>
      OperationModel.fromMap(json.decode(source));
}
