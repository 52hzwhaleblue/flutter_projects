import 'package:flutter/material.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, this.idList, this.sortName}) : super(key: key);

  final String? idList;
  final String? sortName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('About Screen'),),
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text('id_list = ${idList ?? 'Null'}'),
          Text('sortName = ${sortName ?? 'asc'}'), // kiem tra sortName != null thi hien thi sortName, nguoc lai hien thi 'Null'
          ],),
      ),
    );
  }
}
