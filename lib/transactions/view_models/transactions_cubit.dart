
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view_models/transaction_repository.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/view_models/transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final TransactionRepository _repository;

  TransactionsCubit(this._repository) : super(InitialTransactionsState());

  Future<void> loadTransactions() async {
    emit(LoadingTransactionsState());
    try {
      final transactions = await _repository.fetchAllTransactions();
      emit(LoadedTransactionsState(transactions));
    } catch (e) {
      emit(ErrorTransactionsState(e.toString()));
    }
  }
}