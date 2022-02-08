
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_boilerplate/data/local/user.dart';


class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: context.watch<User>().count,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(child: Text(context.watch<User>().user[index])),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),

        // child: Column(
        //   children: [
        //     Text('${context.watch<ShoppingCart>().count}'),
        //     Text('${context.watch<ShoppingCart>().cart}')
        //   ],
        // ),


      ),
      // floatingActionButton: FloatingActionButton(
      //   key: const Key('addItem_floatingActionButton'),
      //   onPressed: () => context.read<ShoppingCart>().addItem('Bread'),
      //   tooltip: 'Add Item',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}