import 'package:flutter/material.dart';
import 'package:flutter_application_dio/core/user_repository.dart';
import 'package:flutter_application_dio/model/model.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api with Dio"),
      
      ),
 body: FutureBuilder<List<TodoModel>>(
 future: UserRepository().getUser(), 
 builder: (context,snapshot){
  if(snapshot.hasData){
    return ListView.builder(
   itemCount: snapshot.data!.length,
   itemBuilder:(context,index){
    final todo = snapshot.data![index];
    return CheckboxListTile(
      value: todo.completed,
      onChanged: (value){},   
      title: Text(todo.title + todo.id.toString()),
                  subtitle: Text(todo.userId.toString()),
    );
   }
    );
  }else {
    return Shimmer.fromColors(
       baseColor: Colors.grey[400]!,
       highlightColor: Colors.grey[300]!,
       child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context,index)=>Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
          margin: const EdgeInsets.symmetric(
            vertical: 10,horizontal: 10,
          ),
          height: 100,
          width: 200,
        ),
       ),

    );
  }
 }),
    );
  }
}