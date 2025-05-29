abstract class Notestate {}

class NoteIntial extends Notestate {}

class Noteloading extends Notestate {}

class Notesucess extends Notestate {}

class NoteFaliure extends Notestate {
  String errMessage;

  NoteFaliure({required this.errMessage});
}
