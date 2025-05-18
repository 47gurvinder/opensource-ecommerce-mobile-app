import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart' as html;

class HtmlWidget extends StatelessWidget {
  final String s;
  final html.CustomStylesBuilder? customStylesBuilder;

  const HtmlWidget(this.s, {super.key, this.customStylesBuilder});

  @override
  Widget build(BuildContext context) {
    return html.HtmlWidget(
      s,
      customStylesBuilder: customStylesBuilder,
    );
  }
}
