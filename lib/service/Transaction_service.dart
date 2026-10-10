

import 'package:figma_design_clone/model/expence_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionService {

  final Box<TransactionModel> box= Hive.box<TransactionModel>('transaction');

  Future<void> addService (TransactionModel transactionModel)async{
    await box.add(transactionModel);

  }

  List<TransactionModel> getService (){
    return box.values.toList().reversed.toList();
  }
}