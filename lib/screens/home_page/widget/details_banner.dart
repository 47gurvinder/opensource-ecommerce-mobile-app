
/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

import 'package:bagisto_app_demo/utils/app_constants.dart';
import 'package:flutter/material.dart';
import '../../../widgets/image_view.dart';
import  'package:bagisto_app_demo/html_widget.dart';

class DetailsBannerView extends StatelessWidget {
  final String? title;
  final String? imgUrl;
  const DetailsBannerView({super.key, this.title, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.spacingMedium),
          child: ImageView(
            url: imgUrl,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.spacingWide/2),
          child: HtmlWidget(
            title ?? "",
          ),
        ),
        const SizedBox(height: AppSizes.spacingNormal)
      ],
    );
  }
}
