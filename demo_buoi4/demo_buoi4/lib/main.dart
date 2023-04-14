import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  // TODO: Buoc 1 them await Hive.initFlutter();
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TODO: khai  bao du lieu
  List<Map<String, String?>> listToDo = [];
  late final Box _box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Khai bao data
    _initData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _initData() async {
    _box = await Hive.openBox('box_todo');
    _readHive();
  }

  //Doc Du Lieu
  _readHive() {
    final List<Map<String, String?>> result = [];
    final a = _box.get('data_todo');
    final mapData = jsonDecode(a) as List;
    for (var e in mapData) {
      final a = Map<String, String?>.from(e);
      result.add(a);
    }
    // Set Trang Thai Thay Doi cua Danh Sach
    setState(() {
      listToDo = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Demo'),
      ),
      body: ListView.builder(
          itemCount: listToDo.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: (index % 2 == 0) ? Colors.white : Colors.grey.shade200,
              title: Text(listToDo[index]['name']!),
              subtitle: Text(listToDo[index]['note'] ?? ''),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data = await showModalBottomSheet(
              context: context, builder: (_) => const FormAddToDo());
          _addListTodo(data: data);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _addListTodo({required data}) {
    setState(() {
      listToDo.add(data);
    });
    _updateHive();
  }

  _updateHive() {
    _box.clear();
    _box.put('data_todo', jsonEncode(listToDo));
  }
}

class FormAddToDo extends StatefulWidget {
  const FormAddToDo({Key? key}) : super(key: key);

  @override
  State<FormAddToDo> createState() => _FormAddToDoState();
}

class _FormAddToDoState extends State<FormAddToDo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Nhap ten cong viec'),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            controller: _noteController,
            decoration: InputDecoration(hintText: 'Ghi chu'),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                final String name = _nameController.text;
                final String note = _noteController.text;
                Navigator.pop(context, {'name': name, 'note': note});
              },
              child: Text('Them'))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _noteController.dispose();
  }
}
