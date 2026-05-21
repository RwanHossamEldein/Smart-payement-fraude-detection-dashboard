import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/model/api_service.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view/pages/transactions_page.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view_models/transaction_repository.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view_models/transactions_cubit.dart';

void main() {
  runApp(const MyApp(

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TransactionsCubit(
      TransactionRepository(ApiService( Dio()))
    ), child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TransactionsPage(),));
  }
}

