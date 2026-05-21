import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view/widgets/data_table.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view/widgets/details_card.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view/widgets/fraud_ratio_doughnut_chart.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view_models/transactions_cubit.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view_models/transactions_state.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SmartPay Fraud Monitor", style: TextStyle(fontWeight: FontWeight.bold),
      ),

     actions: [
      IconButton(onPressed: (){
        context.read<TransactionsCubit>().loadTransactions();
      }, icon: Icon(Icons.refresh))
     ],),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 10, 111, 155), Color.fromARGB(255, 192, 216, 234)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
       child: BlocBuilder<TransactionsCubit, TransactionsState>(builder: (context, state) {
        if (state is LoadingTransactionsState) {
          return const Center(child: CircularProgressIndicator());
        }
        else if(state is ErrorTransactionsState){
          return Center(child: Text("Error: ${state.message}"));
        }
        else if(state is LoadedTransactionsState){
          final transactions = state.transactions;
          final total = transactions.length;
          final fraudCount = transactions.where((t) => t.isFraud == 1).length;
          final safeCount = total - fraudCount;
          final fraudPercent = total > 0 ? (fraudCount / total * 100).toStringAsFixed(1) : "0";

          return SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: DetailsCardWidget(title: "Total", value: "$total", icon: Icons.list, color: Colors.blue)),
                    const SizedBox(width: 15),
                    Expanded(child: DetailsCardWidget(title: "Fraud", value: "$fraudCount", icon: Icons.warning, color: Colors.red)),
                    const SizedBox(width: 15),
                    Expanded(child: DetailsCardWidget(title: "Safe", value: "$safeCount", icon: Icons.check_circle, color: Colors.green)),
                  ],
                ),
                const SizedBox(height: 30),
                Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Fraud Risk Ratio", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        FraudRatioChart(fraudCount: fraudCount, safeCount: safeCount, percentage: fraudPercent),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Recent Transactions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        DataTableWidget(transactions: transactions),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

      return const Center(child: Text("Press refresh to load data"));
       }
       ),
         ),
    );
  }
}