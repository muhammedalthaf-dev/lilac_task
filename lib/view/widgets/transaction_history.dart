import 'package:figma_design_clone/service/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TransactionHistory extends ConsumerWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Transactions History',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
              },
              child: const Text(
                'See all',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),

        if (transactions.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'No transactions yet',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        else
          ...transactions.take(3).map((transaction) {
            final isIncome =
                transaction.type.trim().toLowerCase() == 'income';

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _formatDate(transaction.date),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    '${isIncome ? '+' : '-'} \$ ${transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: isIncome
                          ? const Color(0xFF08B66B)
                          : const Color(0xFFFF4D4D),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();

    if (DateUtils.isSameDay(date, now)) {
      return 'Today';
    }

    if (DateUtils.isSameDay(
      date,
      now.subtract(const Duration(days: 1)),
    )) {
      return 'Yesterday';
    }

    return DateFormat('MMM d, yyyy').format(date);
  }
}