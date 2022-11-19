import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_boilerplate/core/drawer/ui/drawer.dart';
// import 'package:flutter_boilerplate/data/network/api.dart';

import 'package:flutter_boilerplate/modules/home/cubit/counter_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final Future _users = HttpService().fetchUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // drawer: const NavigationDrawer(),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => CounterCubit(),

          // create: (_) => LoginCubit(),
          // child: LoginForm(),
        ),
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: <Widget>[
      //     FloatingActionButton(
      //       key: const Key('counterView_increment_floatingActionButton'),
      //       child: const Icon(Icons.add),
      //       onPressed: () => context.read<CounterCubit>().increment(),
      //     ),
      //     const SizedBox(height: 8),
      //     FloatingActionButton(
      //       key: const Key('counterView_decrement_floatingActionButton'),
      //       child: const Icon(Icons.remove),
      //       onPressed: () => context.read<CounterCubit>().decrement(),
      //     ),
      //   ],
      // ),

      // body: FutureBuilder(
      //   future: _users,
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasError) {
      //       return Center(child: Text('Some error occurred ${snapshot.error}'));
      //     } else if (snapshot.hasData) {
      //       final users = snapshot.data;
      //       return ListView.builder(
      //           itemCount: users.length,
      //           itemBuilder: (context, index) {
      //             Map user = users[index];
      //             return ListTile(
      //               title: Text('${user['name']}'),
      //               subtitle: Text('${user['age']}'),
      //               // onTap: () {
      //               //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetails(thisItem['id'].toString())));
      //               // },
      //             );
      //           });
      //     } else {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
