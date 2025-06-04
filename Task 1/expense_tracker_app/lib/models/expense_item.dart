class ExpenseItem {
  final String name;
  final String amount;
  final DateTime dateTime;

  ExpenseItem({
    required this.name,
    required this.amount,
    required this.dateTime,
  });

  // Convert to Map for storage
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  // Convert from Map when reading
  factory ExpenseItem.fromMap(Map<String, dynamic> map) {
    return ExpenseItem(
      name: map['name'],
      amount: map['amount'],
      dateTime: DateTime.parse(map['dateTime']),
    );
  }
}
