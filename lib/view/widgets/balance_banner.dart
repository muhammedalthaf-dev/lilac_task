import 'package:figma_design_clone/core/constents/app_colors.dart';
import 'package:figma_design_clone/service/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceCard extends ConsumerWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionProvider);

    final income = transactions
        .where((transaction) =>
            transaction.type.toLowerCase() == 'income')
        .fold<double>(
          0,
          (sum, transaction) => sum + transaction.amount,
        );

    final expenses = transactions
        .where((transaction) =>
            transaction.type.toLowerCase() == 'expense')
        .fold<double>(
          0,
          (sum, transaction) => sum + transaction.amount,
        );

    final balance = income - expenses;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration:  BoxDecoration(
        color: AppColors.primery,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            '\$ ${balance.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 22),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildIcon(Icons.arrow_downward),
                        const SizedBox(width: 6),
                        const Text(
                          'Income',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$ ${income.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildIcon(Icons.arrow_upward),
                        const SizedBox(width: 6),
                        const Text(
                          'Expenses',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$ ${expenses.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: Colors.white24,
      child: Icon(
        icon,
        size: 13,
        color: Colors.white,
      ),
    );
  }
}