import 'dart:convert';

class PiggyBankModel {
  PiggyBankModel({
    this.id,
    this.title,
    this.balance,
  });

  int id;
  String title;
  double balance;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'balance': balance,
    };
  }

  factory PiggyBankModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PiggyBankModel(
      id: map['id'],
      title: map['title'],
      balance: map['balance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PiggyBankModel.fromJson(String source) =>
      PiggyBankModel.fromMap(json.decode(source));
}
