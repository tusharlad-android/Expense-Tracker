import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses,required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense)onRemoveExpense;

  Widget build(context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            key: ValueKey(expenses[index]),
            //used to show background when the item is going to get deleted
            background: Container(
              color:Theme.of(context).colorScheme.error.withOpacity(0.75),
              
            ),
            onDismissed: (direction){
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index]),
          );
          //dismissable is use to delete the item in the list with swipe
        });
  }
}
