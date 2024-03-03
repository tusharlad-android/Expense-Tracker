import 'package:expenses_tracker/chart.dart/chart.dart';
import 'package:expenses_tracker/widget/NewExpense.dart';
import 'package:expenses_tracker/widget/expenses_list/expense_list.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'flutter course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: ' cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      //used to avoid from camera overlapping the widget
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseindex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    //to undo any remove expense
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('Expense deleted.'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseindex, expense);
              });
            })));
  }

  Widget build(context) {
    //used to find the width of the device
    var width=MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: width<600 ? Column(
        //used to switch when the device is being rotated
        children: [
          //Toolbar can be added over here also

          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
          //here we have to use expanded because column has another column inside it due to which it is difficult for it to understand sizing .
        ],
      ):Row(children: [
        Expanded(
          child:Chart(expenses: _registeredExpenses),
        //expanded should be wrapped around chart because the chart inside the row is taking full width and the Row is also taking fullwidth till infinity 
        //Due to which flutter is not available to assign size to the widget
        //There fore we will make use of expanded 
        //Expanded constraints the child to only take as much width as available in the row after sizing the Row childern.
        ),

          Expanded(
            child: mainContent,
          ),]),
    );
  }
}
