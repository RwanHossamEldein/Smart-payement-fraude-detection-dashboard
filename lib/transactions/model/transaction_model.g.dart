// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      ccNum: json['cc_num'] as String,
      amount: (json['amt'] as num).toDouble(),
      merchant: json['merchant'] as String,
      category: json['category'] as String,
      isFraud: (json['is_fraud'] as num).toInt(),
      fraudProbability: json['fraud_probability'] as String,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'cc_num': instance.ccNum,
      'amt': instance.amount,
      'merchant': instance.merchant,
      'category': instance.category,
      'is_fraud': instance.isFraud,
      'fraud_probability': instance.fraudProbability,
    };
