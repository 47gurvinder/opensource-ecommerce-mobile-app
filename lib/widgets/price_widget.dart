/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import  'package:bagisto_app_demo/html_widget.dart';

class PriceWidgetHtml extends StatelessWidget {
  final String priceHtml;
  const PriceWidgetHtml({super.key, required this.priceHtml});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.spacingNormal),
      child: HtmlWidget(
        priceHtml,
        customStylesBuilder: (element) {
          if (element.classes.contains('line-through')) {
            return {'text-decoration': 'line-through'};
          }
          else if (element.classes.contains('font-semibold')) {
            return {'font-weight': '600'};
          }
          else if (element.classes.contains('font-medium')) {
            return {'font-weight': '500'};
          }
          else if (element.classes.contains('text-[#')) {
            return {'text-decoration-color': element.className.split('text-[').last.replaceAll(']', '')};
          }
          else if (element.classes.contains('grid-gap')) {
            return {'grid-column-gap' : '0px','grid-row-gap' : '0px'};
          }
          else if (element.classes.contains('flex-gap')) {
            return {'flex' : '1'};
          }
          return null;
        },
      ),
    );
  }
}
