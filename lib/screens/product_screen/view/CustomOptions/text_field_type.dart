/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

// ignore_for_file: file_names, must_be_immutable

import 'package:bagisto_app_demo/utils/index.dart';
import '../../../../data_model/product_model/product_screen_model.dart';


class DropDownType extends StatefulWidget {
  List<Options?> options;
  Attributes? variation;

  final Function(int)? callback;

  DropDownType({super.key, this.variation, required this.options, this.callback});

  @override
  State<StatefulWidget> createState() => _DropDownTypeState();
}

class _DropDownTypeState extends State<DropDownType> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidgets().getDropdown(
        Key(widget.variation?.id?.toString() ?? ''),
        context,
        widget.options.map((e) => e?.label ?? '').toList(),
        widget.variation?.label,
        null,
        null,
        widget.variation?.label ?? "", (p0, p1) {
      if (widget.callback != null) {
        widget.callback!(int.parse(
            widget.options.firstWhere((element) => element?.label == p0)?.id ??
                ""));
      }
    }, false);
  }
}
