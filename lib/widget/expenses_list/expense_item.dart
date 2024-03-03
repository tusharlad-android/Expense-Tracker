import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense,{super.key});
  final Expense expense;

  Widget build(context){
    return Card(
      margin:const EdgeInsets.symmetric(horizontal: 20,vertical:10),
      child:Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical :16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title,style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height:4),
            Row(children: [Text(
              '\$${expense.amount.toStringAsFixed(2)}', 
              //12.3433->12.34
              
            ),
            Spacer(),
            Row(children: [
              Icon(categoryIcons[expense.category]),
              SizedBox(width: 8,),
              Text(expense.formattedDate),
            ],)
              
              ],)
          ],
        ),
      )
      );

  }
}