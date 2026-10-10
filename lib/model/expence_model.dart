

import 'package:hive/hive.dart';
part 'expence_model.g.dart';

@HiveType(typeId: 0)
class  TransactionModel {

  @HiveField(0)
  final String type;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime date;

  TransactionModel({
    required this.type,
    required this.name,
    required this.amount,
    required this.date
  });
  
}