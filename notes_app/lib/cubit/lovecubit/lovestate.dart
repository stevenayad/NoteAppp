abstract class Lovestate {}

class loveIntial extends Lovestate {}

class loveloading extends Lovestate {}

class lovesucess extends Lovestate {}

class loveFaliure extends Lovestate {
  String errMessage;

  loveFaliure({required this.errMessage});
}
