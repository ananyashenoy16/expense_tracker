import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; //imported using dart pub add uuid package
import 'package:intl/intl.dart'; //to format the date we imported intlflutter pub add intl
const uuid=Uuid();

final formatter =DateFormat.yMd(); //specified the format and stored in an object

//this is created because if we give string type to the category any string is accepted and there will be no error

enum Category {food,travel,leisure,work}

const categoryIcons ={
  Category.food:Icons.lunch_dining,
  Category.travel:Icons.flight_takeoff,
  Category.leisure:Icons.movie,
  Category.work:  Icons.work,
};

class Expense {
  Expense({required this.title,
  required this.amount,
   required this.date,
   required this.category,     
  }):id=uuid.v4(); //to create a unique id each time

  //declaration of data
  final String id;
  final String title;
  final double  amount;
  final DateTime date;
  final Category category;


  //getter
  String get formattedDate{
    return formatter.format(date); //using the object to format the date 
  }
}
class ExpenseBucket{
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  ExpenseBucket.forCategory(List<Expense> allExpenses,this.category) :
   expenses=allExpenses.where((expense)=> expense.category== category).toList();
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses{
    double sum=0;
    for (final expense in expenses){
       sum+=expense.amount;
    }
      return sum;
  }
}