import 'package:figma_design_clone/model/expence_model.dart';
import 'package:figma_design_clone/service/Transaction_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final transactionServiceProvider = Provider<TransactionService>((ref) {
  return TransactionService();
});

final transactionProvider =
    StateNotifierProvider<TransactionNotifier, List<TransactionModel>>(
  (ref) {
    return TransactionNotifier(
      ref.read(transactionServiceProvider),
    );
  },
);

class TransactionNotifier extends StateNotifier<List<TransactionModel>> {
  final TransactionService service;

  TransactionNotifier(this.service) : super(service.getService());

  Future<void> addTransaction(TransactionModel transaction) async {
    await service.addService(transaction);

    state = service.getService();
  }
}