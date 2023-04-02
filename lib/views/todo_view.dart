import 'package:flutter/material.dart';
import 'package:test/constants/custom_colors.dart';
import 'package:test/views/add_new_thing.dart';


class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.basic,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        title: const Text("Your Things"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewThing())),
        child:const Icon(Icons.add_sharp,size: 35),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(itemBuilder: (context,index){
          return InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewThing())),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: CustomColors.basic,
                child: Icon(Icons.delete,color: CustomColors.error,),
              ),
              trailing: Text("9PM"),
              title: Text("Daily Morning Walking!!!"),
              subtitle: Text("wake up in the morning and doo excersice!"),
            ),
          );
        }, separatorBuilder: (context,index){
          return const Divider();
        }, itemCount: 3)
      ),
    );
  }
}
