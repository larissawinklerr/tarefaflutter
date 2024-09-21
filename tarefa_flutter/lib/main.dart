import 'package:flutter/material.dart';
import 'package:new_project/views/list_form_tasks.dart';
import 'package:new_project/views/list_view_tasks.dart';

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
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 255, 0, 208)),
        useMaterial3: false,
      ),
      home: MyWidget(),
      routes: {
        '/listarTarefas': (context) => ListViewTasks(),
        '/criarTarefas': (context) => CreateTasks()
      },
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('lista de tarefas'),
        ),
        drawer: Drawer(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName:
                    Text('Larissa Winkler', style: TextStyle(fontSize: 24)),
                accountEmail: Text('winkler@gmail.com'),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white, child: Icon(Icons.person))),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('listagem de tarefas'),
              onTap: () {
                Navigator.pushNamed(context, '/listarTarefas');
              },
            )
          ],
        )),
        body: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(right: 10, bottom: 30),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/criarTarefas');
                        },
                        child: Icon(Icons.add))))
          ],
        ));
  }
}
