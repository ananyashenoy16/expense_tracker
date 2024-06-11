
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget{

  const Expenses({super.key});
  @override
  State<Expenses> createState() {
   
  return _ExpensesState();
  }
}


class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeredExpenses = [
    Expense(title: 'flutter course',
     amount: 19.99,
      date:DateTime.now(),
      category: Category.work),

      Expense(title: 'cinema ',
     amount: 15.69,
      date:DateTime.now(),
      category: Category.leisure),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(isScrollControlled: true, //overlay will have full height
      context: context, builder:(ctx)=>  NewExpense(onAddExpense: _addExpense,));
  }
 
  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
   
  }

    void _removeExpense(Expense expense){
      final expenseIndex= _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
     ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      duration:const   Duration(seconds: 3),
      action:  SnackBarAction(label: 'undo', onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseIndex, expense);
        });
      }),
      content:const Text( 'Expense deleted'),),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        backgroundColor: Color.fromRGBO(104, 5, 226, 0.6),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
           icon:const  Icon(Icons.add))
        ],),
      body: Column(children: [

         Chart(expenses: _registeredExpenses),
        Expanded(child:ExpensesList(expenses: _registeredExpenses,onRemoveExpense: _removeExpense,))
      ]),
    );
  }
}