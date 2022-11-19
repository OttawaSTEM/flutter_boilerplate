import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_boilerplate/core/drawer/ui/drawer.dart';
// import 'package:flutter_boilerplate/data/network/api.dart';


import 'package:flutter_boilerplate/modules/home/ui/bloc/counter_bloc.dart';
import 'package:flutter_boilerplate/modules/home/ui/bloc/counter_event.dart';
// import 'package:flutter_boilerplate/modules/home/ui/bloc/counter_event.dart';
// import 'package:flutter_boilerplate/modules/home/ui/bloc/counter_state.dart';


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
body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'IncrementButton',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(IncrementCounterEvent());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'DecrementButton',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(DecrementCounterEvent());
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ), // 
    ),








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
      ),
    );
  }
}
