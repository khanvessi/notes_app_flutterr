import 'package:flutter/material.dart';
import 'package:notes_app/utils/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(BuildContext context,
    String text,) {
  return showGenericDialog(context: context,
    title: 'an Error accured',
    content: text,
    optionBuilder: () => {
    'Ok': null,
    },);
}