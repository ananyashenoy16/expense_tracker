import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget{

  const ExpensesList({super.key,required this.expenses,required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
  //it creates a scrollable widget \,use this instead of the column
   return ListView.builder(
    itemCount: expenses.length,
    itemBuilder: (ctx,index) =>Dismissible(
      onDismissed: (direction){
        onRemoveExpense(expenses[index]);
      },
      key: ValueKey(expenses[index]), 
      
      child: ExpenseItem(expenses[index])) 
   );
  }
}