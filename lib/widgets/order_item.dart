import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealapp/providers/provide_order.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final OrderItemModel item;

  OrderItem(this.item);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.item.amount}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.item.dateTime)),
            trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                }),
          ),
          if (_expanded)
            Container(
                height: min(widget.item.products.length * 20.0 + 10, 100),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  children: widget.item.products
                      .map(
                        (prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${prod.quantity}x \$${prod.price}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ),
                      )
                      .toList(),
                )),
        ],
      ),
    );
  }
}
