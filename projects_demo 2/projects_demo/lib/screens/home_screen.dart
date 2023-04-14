import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text('Home Screen'),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            context.go('/about'); // chuyen va thay the context hien tai
          }, child: Text('Go to About Screen')),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: () async{
            final res = await context.push('/about', extra: {'name':'flutter'}); // chuyen qua screen moi (ra 1 nhanh tree moi)
            print(res);
          }, child: Text('Push to About Screen')),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            context.go('/splash'); // chuyen qua screen moi (ra 1 nhanh tree moi)
          }, child: Text('Go to Splash Screen'))
        ],),
      ),
    );
  }
}
