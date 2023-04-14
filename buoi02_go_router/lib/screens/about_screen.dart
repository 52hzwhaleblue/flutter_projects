import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('About Screen'),),
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text('About Screen : $name'),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
              context.pop({'success':true}); // Xoa Screen hien tai va quay ve trang truoc do
          }, child: const Text('Pop to Home Screen'),),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            context.push('/product?id_list=123'); // go ve home
          }, child: const Text('Push to Product Screen'),),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            context.push('/detail/abc1234'); // go ve home
          }, child: const Text('Push to Detail Screen'),)
        ],),
      ),
    );
  }
}
