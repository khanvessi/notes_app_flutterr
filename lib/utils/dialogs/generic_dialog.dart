import 'package:flutter/material.dart';

//MAP OF STRING ENSURES THAT EVERY KEY IN THIS CASE OF STRING IS UNIQUE I.E YOU CAN'T HAVE TWO DIFF. BUTTONS WITH THE SAME TITLES
typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionBuilder,
}) {
  final options = optionBuilder();
  return showDialog<T>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          //MAPPING THE KEY'S VALUE TO THE TEXT OF THE BUTTON
          actions: options.keys.map((optionTitle) {
            final T value = options[optionTitle];
            return TextButton(onPressed: () {
              if(value!=null){
                Navigator.of(context).pop(value);
              }else{
                //FOR THE DIALOGS THAT DO NOT HAVE ANY VALUE  
                Navigator.of(context).pop;
              }
            }, child: Text(optionTitle),);
          }).toList(),
        );
      }
  );
}
