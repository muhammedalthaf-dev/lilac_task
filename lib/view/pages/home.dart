import 'package:figma_design_clone/view/widgets/balance_banner.dart';
import 'package:figma_design_clone/view/widgets/transaction_history.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Padding(padding: EdgeInsetsGeometry.all(15)),
            Text('Good Morning'),
            Text('Sahal Muhammed',style: TextStyle(fontWeight: .bold,fontSize: 20),),
            SizedBox(height: 30,),
            BalanceCard(),
             SizedBox(height: 30,),
             TransactionHistory()

          ],
        ),
      ),
    );
  }
}