import 'package:flutter/material.dart';
import 'package:notes_app/utils/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog(context: context,
    title: 'Delete',
    content: 'Are you sure you want to delete this item?',
    optionBuilder: () =>
    {
      'Cancel': false,
      'Yes': true,
      //WHEN THE USER TYPES OUTSIDE THE DIALOG (TO DISMISS THE DIALOG) THAT'S WHY .then....
    },).then((value) => value ?? false,);
}