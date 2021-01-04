import 'package:flutter/foundation.dart';
import 'package:mealapp/providers/provide_cart.dart';

class OrderItemModel {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItemModel(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.dateTime});
}

class ProvideOrder with ChangeNotifier {
  List<OrderItemModel> _orders = [];

  List<OrderItemModel> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems, double total) {
    _orders.insert(
      0,
      new OrderItemModel(
          id: DateTime.now().toString(),
          amount: total,
          products: cartItems,
          dateTime: DateTime.now()),
    );
    notifyListeners();
  }
}
