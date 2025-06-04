import 'package:hive/hive.dart';
import 'package:expense_tracker_app/models/expense_item.dart';

class HiveDatabase {
  final _myBox = Hive.box('expense_database');

  List<ExpenseItem> readData() {
    final rawList = _myBox.get("ALL_EXPENSES", defaultValue: []);
    if (rawList == null) return [];

    return List<ExpenseItem>.from(
      rawList
          .map((item) => ExpenseItem.fromMap(Map<String, dynamic>.from(item))),
    );
  }

  void saveData(List<ExpenseItem> allExpenses) {
    final data = allExpenses.map((expense) => expense.toMap()).toList();
    _myBox.put("ALL_EXPENSES", data);
  }
}
