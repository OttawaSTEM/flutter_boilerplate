import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_boilerplate/models/user.dart';


class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<User>().fetchData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Center(
          child: Consumer<User> (
            builder: (context, value, child) {
              return value.jsonData.isEmpty && !value.error
                ? const CircularProgressIndicator()
                : value.error
                  ? Text(
                      'Oops, something went wrong. ${value.errorMessage}',
                      textAlign: TextAlign.center,
                    )
                  : ListView.builder(
                    itemCount: value.jsonData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return UserCard(
                        data: value.jsonData[index]
                      );
                    },

                  );

                  // : ListView.separated(
                  //   padding: const EdgeInsets.all(8),
                  //   itemCount: value.jsonData.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return SizedBox(
                  //       height: 50,
                  //       child: Center(child: Text(value.jsonData[index].name)),
                  //     );
                  //   },
                  //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                  // );
            }
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.data}) : super(key: key);
  final Map<dynamic, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 10,
        child: Text('${data['name']}'),
      ),
      
    );
  }

}