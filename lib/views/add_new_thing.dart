import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/constants/custom_colors.dart';
import 'package:test/widgets/adjust_height_widget.dart';
import 'package:test/widgets/inputborder_widget.dart';

class AddNewThing extends StatefulWidget {
  String title1,
  description1,
  dateTime1,id1;
  bool isEdit;
  AddNewThing({Key? key,required this.dateTime1,required this.id1,required this.description1,required this.title1,required this.isEdit}) : super(key: key);

  @override
  _AddNewThingState createState() => _AddNewThingState();
}

class _AddNewThingState extends State<AddNewThing> {
  final TextEditingController _title=TextEditingController();
  final TextEditingController _description=TextEditingController();
  final TextEditingController _dateTime=TextEditingController();
  final _form=GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _title.text=widget.title1;
      _description.text=widget.description1;
      _dateTime.text=widget.dateTime1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Padding(
        padding: const EdgeInsets.only(top: 55,left: 15,right: 15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: ()=>Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,color: Colors.blue,)),
                  const Text("Add new thing",style:  TextStyle(color: CustomColors.basic,fontSize: 16),),
                  AdjustHeight().customHeight(0),
                ],
              ),
              AdjustHeight().customHeight(30),
              Container(
                padding:const  EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all( color: CustomColors.lightBasic)
                ),
                child:const  Icon(Icons.edit,color: CustomColors.lightBasic),
              ),
              AdjustHeight().customHeight(50),
              TextFormField(
                controller: _title,
                style:const TextStyle(color: CustomColors.basic),
                decoration: const InputDecoration(
                    border: fieldBorder,
                    focusedBorder:  fieldBorder,
                    enabledBorder:  fieldBorder,
                    hintText: "Title",
                    contentPadding:const EdgeInsets.only(bottom: 0),
                    hintStyle:const TextStyle(color: CustomColors.lightBasic)
                ),
                validator: (val){
                  if(val!.isEmpty){
                    return 'enter any title';
                  }
                  return null;
                },
              ),
              AdjustHeight().customHeight(30),
              TextFormField(
                controller: _description,
                style:const TextStyle(color: CustomColors.basic),
                decoration: const InputDecoration(
                    border: fieldBorder,
                    focusedBorder:  fieldBorder,
                    enabledBorder:  fieldBorder,
                    hintText: "Description",
                    contentPadding:const EdgeInsets.only(bottom: 0),
                    hintStyle:const TextStyle(color: CustomColors.lightBasic)
                ),
                validator: (val){
                  if(val!.isEmpty){
                    return 'enter any description';
                  }
                  return null;
                },
              ),
              AdjustHeight().customHeight(30),
              DateTimePicker(
                controller: _dateTime,
                style:const TextStyle(color: CustomColors.basic),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                dateLabelText: 'Date',
                onChanged: (val) => print(val),
                validator: (val){
                  if(val!.isEmpty){
                    return 'pick any Future date';
                  }
                  return null;
                },
                onSaved: (val) => print(val),
                decoration:const InputDecoration(
                    border: fieldBorder,
                    focusedBorder:  fieldBorder,
                    enabledBorder:  fieldBorder,
                    hintText: "Date and Time",
                    contentPadding:const EdgeInsets.only(bottom: 0),
                    hintStyle:const TextStyle(color: CustomColors.lightBasic)
                ),
              ),
              AdjustHeight().customHeight(30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize:const Size(double.maxFinite, 50)
                  ),
                  onPressed: (){
                    if(_form.currentState!.validate()){
                      addNewThing();
                    }
                  },
                  child:const Text("ADD YOUR THING")
              )
            ],
          ),
        ),
      ),
    );
  }
  addNewThing()async{
    final newThing= widget.isEdit?FirebaseFirestore.instance.collection("Test").doc(widget.id1):FirebaseFirestore.instance.collection("Test").doc();
    final json={
      'title':_title.text.trim(),
      'description':_description.text.trim(),
      'dateTime':_dateTime.text.trim(),
      'user': FirebaseAuth.instance.currentUser!.email
    };
    await newThing.set(json);
    Navigator.pop(context);
  }
}
