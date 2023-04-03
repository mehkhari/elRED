import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/constants/custom_colors.dart';
import 'package:test/providers/login_provider.dart';
import 'package:test/utils/snackbar_widget.dart';
import 'package:test/views/todo_view.dart';
import 'package:test/widgets/adjust_height_widget.dart';
import 'package:test/widgets/inputborder_widget.dart';

class LoginViewPage extends StatefulWidget {
  const LoginViewPage({Key? key}) : super(key: key);

  @override
  _LoginViewPageState createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final _form=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginProvider=Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
        key: _form,
        child: Column(
          children: [
            AdjustHeight().customHeight(30),
            TextFormField(
              controller: _email,
              style:const TextStyle(color: CustomColors.basic),
              decoration: const InputDecoration(
                  border: fieldBorder,
                  focusedBorder:  fieldBorder,
                  enabledBorder:  fieldBorder,
                  label: Text("Enter email"),
                  contentPadding: EdgeInsets.only(bottom: 0),
                  labelStyle: TextStyle(color: CustomColors.basic)
              ),
              validator: (val){
                if(val!.isEmpty){
                  return 'enter emailId';
                }
                return null;
              },
            ),
            AdjustHeight().customHeight(30),
            TextFormField(
              controller: _password,
              obscureText: loginProvider.passwordVisible,
              style:const TextStyle(color: CustomColors.basic),
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: ()=>loginProvider.changeVisibility(),
                      child: Icon(loginProvider.passwordVisible?Icons.visibility_off:Icons.visibility,color: CustomColors.basic,)),
                  border: fieldBorder,
                  focusedBorder:  fieldBorder,
                  enabledBorder:  fieldBorder,
                  label:const Text("Enter password"),
                  contentPadding:const EdgeInsets.only(bottom: 0),
                  labelStyle: TextStyle(color: CustomColors.basic)
              ),
              validator: (val){
                if(val!.isEmpty){
                  return "enter any password";
                }
                return null;
              },
            ),
            AdjustHeight().customHeight(30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize:const Size(double.maxFinite, 50)
                ),
                onPressed: (){
                  if(_form.currentState!.validate()){
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text.trim(), password: _password.text.trim()).then((value){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const TodoView()), (route) => false);
                    }).onError((error, stackTrace){
                      ShowSnackBar().showToast(context, "Authentication failed!!!");
                    });
                  }
                },
                child:const Text("LOGIN")
            )
          ],
        ),
      ),
    );
  }
}

