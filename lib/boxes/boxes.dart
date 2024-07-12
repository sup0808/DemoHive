
import 'package:hive/hive.dart';

import '../models/notes_model.dart';

// get notes box statically
class Boxes{
  static Box<NotesModel> getData() => Hive.box('notes');
}