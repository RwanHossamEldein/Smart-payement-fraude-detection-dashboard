import 'package:flutter/material.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/model/transaction_model.dart';

class DataTableWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const DataTableWidget({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns:  const [
          DataColumn(label: Text("Merchant")),
          DataColumn(label: Text("Amount")),
          DataColumn(label: Text("Category")),
          DataColumn(label: Text("Status")),
        ],
        rows: transactions.map<DataRow>((t) {
          return DataRow(cells: [
            DataCell(Text(t.merchant)),
            DataCell(Text("\$${t.amount}")),
            DataCell(Text(t.category)),
            DataCell(
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: t.isFraud == 1 ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  t.isFraud == 1 ? "Fraud" : "Safe",
                  style: TextStyle(color: t.isFraud == 1 ? Colors.red : Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}