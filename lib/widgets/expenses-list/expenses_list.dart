import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
          background: Container(color: Color.fromARGB(255, 158, 87, 220),margin: EdgeInsets.symmetric(horizontal: 16),),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            child: ExpenseItem(expenses[index])),
      ),
    );
  }
}
