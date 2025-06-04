import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ExpenseTitle extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deleteTapped;

  ExpenseTitle({
    super.key,
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(
          '₹{dateTime.day} / ₹{dateTime.month} / ₹{dateTime.year}',
        ),
        trailing: Text('\₹' + amount),
      ),
    );
  }
}
