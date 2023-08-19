import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses-list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter',
        amount: 19.9,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Flutter2',
        amount: 1.9,
        date: DateTime.now(),
        category: Category.work),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted")));
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Widget mainContent = const Center(
      child: Text("No Expenses Found! Start Adding Some!"),
    );
    if (_registeredExpenses.isNotEmpty) {
      (
        mainContent = ExpensesList(
          expenses: _registeredExpenses,
          onRemoveExpense: _removeExpense,
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Expense Tracker"),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
          ], //butoons on App bar
        ),
        body: width < height
            ? Column(children: [
                Chart(expenses: _registeredExpenses),
                mainContent,
              ])
            : Row(children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                mainContent,
              ]));
  }
}
