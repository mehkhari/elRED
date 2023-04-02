import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/constants/custom_colors.dart';
import 'package:test/providers/login_provider.dart';
import 'package:test/views/todo_view.dart';
import 'package:test/widgets/adjust_height_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final InputBorder fieldBorder=const UnderlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.lightBasic,
        width: 1,
      )
  );
  @override
  Widget build(BuildContext context) {
    final loginProvider=Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Center(
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                   padding: const EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     color: CustomColors.lightBasic,
                     borderRadius: BorderRadius.circular(50)
                   ),
                   child: const Text("Login")),
                AdjustHeight().customHeight(30),
               TextFormField(
                 style:const TextStyle(color: CustomColors.basic),
                 decoration: InputDecoration(
                   border: fieldBorder,
                   focusedBorder:  fieldBorder,
                   enabledBorder:  fieldBorder,
                   label:const Text("Enter email"),
                   contentPadding: EdgeInsets.only(bottom: 0),
                   labelStyle: TextStyle(color: CustomColors.basic)
                 ),
               ),
               AdjustHeight().customHeight(30),

               TextFormField(
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
               ),
               AdjustHeight().customHeight(30),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   fixedSize:const Size(double.maxFinite, 50)
                 ),
                   onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const TodoView()));
                   },
                   child:const Text("LOGIN")
               )
             ],
           ),
         ),
      ),
    );
  }
}
