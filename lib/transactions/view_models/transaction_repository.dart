
import 'package:smart_payement_fraude_detection_dashboard/transactions/model/api_service.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/model/transaction_model.dart';

class TransactionRepository {
  final ApiService _apiService;

  TransactionRepository(this._apiService);


  Future<List<TransactionModel>> fetchAllTransactions() async {
    try {
    
      final transactions = await _apiService.getTransactions();
      

      return transactions.reversed.toList(); 
    } catch (e) {

      print("Error in Repository: $e");
      rethrow; 
    }
  }
}