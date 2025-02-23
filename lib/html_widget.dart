import 'package:flutter/material.dart';

class HtmlWidget extends StatelessWidget{
  final String s;
  const HtmlWidget(this.s, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(s);
  }
}