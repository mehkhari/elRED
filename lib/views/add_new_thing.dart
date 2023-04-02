import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:test/constants/custom_colors.dart';
import 'package:test/widgets/adjust_height_widget.dart';

class AddNewThing extends StatefulWidget {
  const AddNewThing({Key? key}) : super(key: key);

  @override
  _AddNewThingState createState() => _AddNewThingState();
}

class _AddNewThingState extends State<AddNewThing> {
  final InputBorder fieldBorder=const UnderlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.lightBasic,
        width: 1,
      )
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Padding(
        padding: const EdgeInsets.only(top: 55,left: 15,right: 15),
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
              style:const TextStyle(color: CustomColors.basic),
              decoration: InputDecoration(
                  border: fieldBorder,
                  focusedBorder:  fieldBorder,
                  enabledBorder:  fieldBorder,
                  hintText: "Title",
                  contentPadding:const EdgeInsets.only(bottom: 0),
                  hintStyle:const TextStyle(color: CustomColors.lightBasic)
              ),
            ),
            AdjustHeight().customHeight(30),
            TextFormField(
              style:const TextStyle(color: CustomColors.basic),
              decoration: InputDecoration(
                  border: fieldBorder,
                  focusedBorder:  fieldBorder,
                  enabledBorder:  fieldBorder,
                  hintText: "Description",
                  contentPadding:const EdgeInsets.only(bottom: 0),
                  hintStyle:const TextStyle(color: CustomColors.lightBasic)
              ),
            ),
            AdjustHeight().customHeight(30),
            DateTimePicker(
              style:const TextStyle(color: CustomColors.basic),
              initialValue: '',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Date',
              onChanged: (val) => print(val),
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => print(val),
              decoration: InputDecoration(
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

                },
                child:const Text("ADD YOUR THING")
            )
          ],
        ),
      ),
    );
  }
}
