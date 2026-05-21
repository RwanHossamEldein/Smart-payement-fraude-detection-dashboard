import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  @JsonKey(name: 'cc_num')
  final String ccNum;

  @JsonKey(name: 'amt')
  final double amount;

  final String merchant;
  final String category;

  @JsonKey(name: 'is_fraud')
  final int isFraud;

  @JsonKey(name: 'fraud_probability')
  final String fraudProbability;

  TransactionModel({
    required this.ccNum,
    required this.amount,
    required this.merchant,
    required this.category,
    required this.isFraud,
    required this.fraudProbability,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}