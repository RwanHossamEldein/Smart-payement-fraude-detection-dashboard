import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FraudRatioChart extends StatelessWidget {
  final int fraudCount;
  final int safeCount;
  final String percentage;

  const FraudRatioChart({
    super.key,
    required this.fraudCount,
    required this.safeCount,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
    
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$percentage%",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const Text("Fraud", style: TextStyle(color: Colors.grey)),
          ],
        ),
   
        SizedBox(
          height: 250, 
          child: PieChart(
            PieChartData(
              sectionsSpace: 5, 
              centerSpaceRadius: 80, 
              sections: [
            
                PieChartSectionData(
                  value: fraudCount.toDouble(),
                  color: Colors.redAccent,
                  radius: 25, 
                  showTitle: false, 
                ),
           
                PieChartSectionData(
                  value: safeCount.toDouble(),
                  color: Colors.greenAccent,
                  radius: 20,
                  showTitle: false,
                ),
              ],
            ),
          ))]);}
}