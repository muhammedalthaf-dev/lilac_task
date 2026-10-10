import 'package:figma_design_clone/core/constents/app_colors.dart';
import 'package:figma_design_clone/core/widgets/app_button.dart';
import 'package:figma_design_clone/model/expence_model.dart';
import 'package:figma_design_clone/service/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPage extends ConsumerStatefulWidget {
  const AddPage({super.key});

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  final _formKey = GlobalKey<FormState>();

  final typeController = TextEditingController();
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    typeController.dispose();
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Save transaction
  Future<void> saveTransaction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final amount = double.tryParse(amountController.text.trim());

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter a valid amount'),
        ),
      );
      return;
    }

    final transaction = TransactionModel(
      type: typeController.text.trim(),
      name: nameController.text.trim(),
      amount: amount,
      date: selectedDate,
    );

    await ref
        .read(transactionProvider.notifier)
        .addTransaction(transaction);

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.primery,
        title: Text(
          'Transaction',
          style: TextStyle(color: AppColors.bgColor),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.bgColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(23),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surffex,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Transaction Type'),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: typeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Expense or Income',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter transaction type';
                        }

                        final type = value.trim().toLowerCase();

                        if (type != 'expense' && type != 'income') {
                          return 'Enter Expense or Income';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 15),
                    const Text('Name'),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Netflix',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter transaction name';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 15),
                    const Text('Amount'),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: amountController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '₹ ---',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter amount';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 15),
                    const Text('Date'),
                    const SizedBox(height: 10),

                    InkWell(
                      onTap: pickDate,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_month),
                        ),
                        child: Text(
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             SizedBox(height: 50,),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: AppButton(
                  ontap: saveTransaction,
                  text: 'Save',
                  style: TextStyle(
                    color: AppColors.bgColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}