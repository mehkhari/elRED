import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/constants/custom_colors.dart';
import 'package:test/providers/login_provider.dart';
import 'package:test/views/login_view_page.dart';
import 'package:test/views/signup_view.dart';
import 'package:test/views/todo_view.dart';
import 'package:test/widgets/adjust_height_widget.dart';
import 'package:test/widgets/inputborder_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                 margin:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.24),
                   padding: const EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     color: CustomColors.lightBasic,
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       InkWell(
                         onTap: ()=>loginProvider.toggleLogin(),
                         child: Container(
                           width:100,
                             decoration: BoxDecoration(
                                 color: loginProvider.isLogin?CustomColors.lightBasic:CustomColors.basic,
                                 borderRadius: BorderRadius.circular(50)
                             ),
                             padding: const EdgeInsets.all(8),
                             child: const Text("Login",textAlign: TextAlign.center)),
                       ),
                       const SizedBox(width: 10,),
                       InkWell(
                         onTap: ()=>loginProvider.toggleLogin(),
                         child: Container(
                             width:100,
                             decoration: BoxDecoration(
                                 color: !loginProvider.isLogin?CustomColors.lightBasic:CustomColors.basic,
                                 borderRadius: BorderRadius.circular(50)
                             ),
                             padding: const EdgeInsets.all(8),
                             child: const Text("SignUp",textAlign: TextAlign.center,)),
                       ),
                     ],
                   )
               ),
               Expanded(child:loginProvider.isLogin?const SignupView():const LoginViewPage())
             ],
           ),
         ),
      ),
    );
  }
}
