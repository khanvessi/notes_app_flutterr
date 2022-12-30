import 'package:flutter/material.dart';

import '../services/crud/notes_service.dart';
import '../utils/dialogs/delete_dialog.dart';

typedef DeleteNoteCallback = void Function(DatabaseNote note);

class NotesListView extends StatelessWidget {
  final List<DatabaseNote> notes;
  final DeleteNoteCallback onDeleteNote;

  //DELIGATING (JUST LIKE A VIEWMODEL)

  const NotesListView({
    Key? key,
    required this.notes,
    required this.onDeleteNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        //DISPLAY EVERY NOTE HERE
        return ListTile(
          title: Text(
            note.text,
            maxLines: 1,
            //CAPING
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          //SPECIFY THE WIDGET THAT WILL BE DISPLAYED AT THE END OF THE TILE (drawable right),
          trailing: IconButton(
            onPressed: () async {
              //NEED TO TAKE CARE OF DIPLAYING THE DIALOG
              final shouldDelete = await showDeleteDialog(context);
              if(shouldDelete){
                onDeleteNote(note);
              }
            },
            icon: Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
