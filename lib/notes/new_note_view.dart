import 'package:flutter/material.dart';
import 'package:notes_app/services/auth/auth_service.dart';

import '../services/crud/notes_service.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({Key? key}) : super(key: key);

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  DatabaseNote? _notes;
  late final NotesService _notesService;
  late final TextEditingController _textController;

  @override
  void initState() {
    _notesService = NotesService();
    _textController = TextEditingController();
    super.initState();
  }

  //UPDATING THE DB ON THE FLY
  void _textControllerListener() async {
    final note = _notes;
    if (note == null) {
      return;
    }
    final text = _textController.text;
    await _notesService.updateNote(
      note: note,
      text: text,
    );
  }

  //REMOVING THE CONTROLLER

  void _setupTextControllerListener() {
    _textController.removeListener(_textControllerListener);
    _textController.addListener(_textControllerListener);
  }

  Future<DatabaseNote> createNewNote() async {
    final existingNote = _notes;
    if (existingNote != null) {
      return existingNote;
    }
    //USER CREATED ALREADY
    final currentUser = AuthService.firebase().currentUser!;
    final email = currentUser.email!;
    final owner = await _notesService.getUser(email: email);
    return await _notesService.createNote(owner: owner);
  }

  void _deleteNoteIfTextIsEmpty() {
    final note = _notes;
    if (_textController.text.isEmpty && note != null)
      _notesService.deleteNote(
        id: note.id,
      );
  }

  void _saveNoteIfTextNotEmpty() async {
    final note = _notes;
    final text = _textController.text;
    if (note != null && text.isEmpty) {
      await _notesService.updateNote(
        note: note,
        text: text,
      );
    }
  }

  @override
  void dispose() {
    _deleteNoteIfTextIsEmpty();
    _saveNoteIfTextNotEmpty();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Note'),
        ),
        //AS SOON AS THE NEW NOTE STATE HAS BEEN CREATED THEN ALSO IT NEEDS TO CREATE A NEW NOTE
        body: FutureBuilder(
            future: createNewNote(),
            builder: (context, snapshot) {
              switch(snapshot.connectionState){
                case ConnectionState.done:
                  // snapshot.data (database notes)
                  _notes = snapshot.data as DatabaseNote;
                  _setupTextControllerListener();
                  return TextField(
                    controller: _textController,
                    //MULTILINE TEXTFIELD
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Start typing your note!',
                    ),
                  );
                default:
                  return const CircularProgressIndicator();
              }
            }));
  }
}
