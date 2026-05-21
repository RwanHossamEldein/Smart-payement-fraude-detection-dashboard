import 'package:smart_payement_fraude_detection_dashboard/transactions/model/transaction_model.dart';

abstract class TransactionsState {
  
}
class InitialTransactionsState extends TransactionsState {
  
}
class LoadingTransactionsState extends TransactionsState {
  
}
class LoadedTransactionsState extends TransactionsState {
 final List<TransactionModel> transactions;
  LoadedTransactionsState(this.transactions);
}
class ErrorTransactionsState extends TransactionsState {
  final String message;
  ErrorTransactionsState(this.message);
}