import 'package:flutter/cupertino.dart';

class KeyB extends StatefulWidget {
  const KeyB({Key? key}) : super(key: key);

  @override
  State<KeyB> createState() => _KeyBState();
}

class _KeyBState extends State<KeyB> {
  @override
  Widget build(BuildContext context) {
    return Text('KeyBoard');
  }
}
