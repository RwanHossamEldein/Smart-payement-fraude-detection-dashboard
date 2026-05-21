import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_payement_fraude_detection_dashboard/transactions/model/transaction_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl:'http://192.168.1.183:5001')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/transactions')
  Future<List<TransactionModel>> getTransactions();
  

}