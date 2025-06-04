import 'package:expense_tracker_app/components/expense_summary.dart';
import 'package:expense_tracker_app/components/expense_title.dart';
import 'package:expense_tracker_app/data/expense_data.dart';
import 'package:expense_tracker_app/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExpenseNameController = TextEditingController();
  final newExpanseRupeesController = TextEditingController();
  final newExpansePaiseController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpenseNameController,
              decoration: const InputDecoration(hintText: "Expense name"),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newExpansePaiseController,
                    decoration: const InputDecoration(hintText: "Rupees"),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: newExpanseRupeesController,
                    decoration: const InputDecoration(hintText: "Paise"),
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  void save() {
    if (newExpenseNameController.text.isNotEmpty &&
        newExpanseRupeesController.text.isNotEmpty &&
        newExpansePaiseController.text.isNotEmpty) {
      String amount =
          '${newExpanseRupeesController.text}.${newExpansePaiseController.text}';
      ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: amount,
        dateTime: DateTime.now(),
      );

      Provider.of<ExpenseData>(context, listen: false)
          .addNewExpense(newExpense);
    }

    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseNameController.clear();
    newExpanseRupeesController.clear();
    newExpansePaiseController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          backgroundColor: Colors.grey,
          child: const Icon(Icons.add),
        ),
        body: ListView(children: [
          ExpenseSummary(startOfWeek: value.startOfWeekDate()),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.getAllExpenseList().length,
            itemBuilder: (context, index) => ExpenseTitle(
              name: value.getAllExpenseList()[index].name,
              amount: value.getAllExpenseList()[index].amount,
              dateTime: value.getAllExpenseList()[index].dateTime,
              deleteTapped: (p0) =>
                  deleteExpense(value.getAllExpenseList()[index]),
            ),
          ),
        ]),
      ),
    );
  }
}
