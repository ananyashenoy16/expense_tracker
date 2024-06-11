import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense,{super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      
      child:Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Column(children: [
          Text(expense.title),
          const  SizedBox(height: 4),
          Row(
            children: [Text('\$${expense.amount.toStringAsFixed(2)}'),//12.3433 will be displayed as 12.34 it rounded off
              const Spacer(), // to push the other two to the lft and right corner
              Row(
              children: [
                Icon(categoryIcons[expense.category]),
                const SizedBox(width: 8,),
                Text(expense.formattedDate)
              ],
             ) 
            ], 
            
          )
        ],
        ),
      ));
  }
}