
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_boilerplate/data/local/counter.dart';
import 'package:flutter_boilerplate/data/local/shopping_cart.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example App (${context.watch<Counter>().count})'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${context.watch<ShoppingCart>().count}'),
            Text('${context.watch<ShoppingCart>().cart}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addItem_floatingActionButton'),
        onPressed: () => context.read<ShoppingCart>().addItem('Bread'),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}