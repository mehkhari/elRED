import 'package:flutter/material.dart';

class ShowSnackBar{
  void showToast(BuildContext context,String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration:const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }
}