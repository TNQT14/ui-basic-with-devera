import 'expense_model.dart';

class Category {
  final String name;
  final double maxAmount;
  final List<Expense> expenses;
  final double total;

  const Category({this.name = "", this.maxAmount = 0.0, this.expenses = const[],
  this.total = 0.0});
}
