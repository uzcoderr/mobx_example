import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobpdp/model/Post.dart';
import 'package:mobpdp/screens/edit_post_screen.dart';
import 'package:mobpdp/service/ApiService.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobpdp/storemobx/home_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  HomeStore homeStore = HomeStore();

  @override
  void initState() {
    homeStore.apiGetUsers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Architecture Patterns'),
      ),
      body: Observer(
        builder:(_) => Center(
            child: ListView.builder(
              itemCount: homeStore.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Slidable(
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (doNothing){
                          homeStore.apiDeleteUsers("${ApiService.GET_API}/$index");
                            setState(() {
                              homeStore.posts.removeAt(index);
                            });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        flex: 2,
                        onPressed: (doNothing){
                          homeStore.nextPage(context, homeStore.posts[index], index);
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Update',
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            homeStore.posts[index].title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            homeStore.posts[index].body,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Divider(),
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
