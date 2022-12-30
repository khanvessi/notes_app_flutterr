import 'package:flutter/material.dart';
import 'package:notes_app/utils/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog(context: context,
    title: 'Logout',
    content: 'Are you sure you want to log out?',
    optionBuilder: () =>
    {
      'Cancel': false,
      'Logout': true,
      //WHEN THE USER TYPES OUTSIDE THE DIALOG (TO DISMISS THE DIALOG) THAT'S WHY .then....
    },).then((value) => value ?? false,);
}