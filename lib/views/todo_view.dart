import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/constants/custom_colors.dart';
import 'package:test/models/user_model.dart';
import 'package:test/providers/login_provider.dart';
import 'package:test/views/add_new_thing.dart';
import 'package:test/views/login_view.dart';


class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    final loginProvider=Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: CustomColors.basic,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        title: const Text("Your Things"),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginView()), (route) => false);
            });
          }, icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewThing(isEdit: false,id1: "",title1: "",description1: "",dateTime1: ""))).then((value) {setState(() {
        });}),
        child:const Icon(Icons.add_sharp,size: 35),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: readUsers().first,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final users=snapshot.data;
              debugPrint("List of Id's---->${loginProvider.docIds}");
              return ListView.separated(itemBuilder: (context,index){
                return InkWell(
                  onTap: ()=>users[index].user==FirebaseAuth.instance.currentUser!.email?Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewThing(
                    isEdit: true,
                    dateTime1: users[index].dateTime,
                    description1: users[index].description,
                    title1: users[index].title,
                    id1: loginProvider.docIds[index].toString(),
                  ))):null,
                  child: ListTile(
                    leading:InkWell(
                      onTap: (){
                        setState(() {
                          users[index].user==FirebaseAuth.instance.currentUser!.email?deleteDocument(loginProvider.docIds[index]):null;
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: CustomColors.basic,
                        child: Icon(Icons.delete,color: CustomColors.error,),
                      ),
                    ),
                    trailing: Text(users[index].dateTime),
                    title: Text(users[index].title),
                    subtitle: Text(users[index].description),
                  ),
                );
              }, separatorBuilder: (context,index){
                return const Divider();
              }, itemCount: users!.length);
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }),
        )
    );
  }
  deleteDocument(String id){
    FirebaseFirestore.instance.collection("Test").doc(id).delete();
  }
  Stream<List<UserRequest>>readUsers()=>FirebaseFirestore.instance.collection('Test').snapshots().map((snapshot) => snapshot.docs.map((e) {
    var data=Provider.of<LoginProvider>(context,listen: false);
    if(!data.docIds.contains(e.id.toString())){
      data.addIds(e.id.toString());
    }
    return UserRequest.fromJson(e.data());
  }).toList());
}
