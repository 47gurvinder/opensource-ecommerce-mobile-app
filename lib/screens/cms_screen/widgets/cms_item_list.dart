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
import 'package:bagisto_app_demo/utils/route_constants.dart';
import 'package:flutter/material.dart';
import '../../../data_model/app_route_arguments.dart';
import '../../../utils/app_global_data.dart';
import '../../../utils/string_constants.dart';
import '../../../widgets/common_widgets.dart';
import 'package:collection/collection.dart';
import '../data_model/cms_model.dart';
import '../../../utils/application_localization.dart';


class CmsItemsList extends StatefulWidget {
  final String? title;
  final CmsData? cmsData;

  const CmsItemsList({super.key, this.title, this.cmsData});

  @override
  State<CmsItemsList> createState() => _CmsItemsListState();
}

class _CmsItemsListState extends State<CmsItemsList> {

  @override
  Widget build(BuildContext context) {
    return buildCmsItems();
  }

  Widget buildCmsItems() {
    if (widget.cmsData != null) {
      return _cmsDataList(widget.cmsData!);
    }
    return _cmsDataList(widget.cmsData!);
  }

  _cmsDataList(
    CmsData cmsData,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: cmsData.data?.length,
              itemBuilder: (context, index) {
              var title = (cmsData.data?[index].translations?.firstWhereOrNull((e) => e.locale== GlobalData.locale));
              if((cmsData.data?[index].translations ?? []).isEmpty) {
                return const SizedBox.shrink();
              }

                return SizedBox(
                  height: AppSizes.buttonHeight,
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, cmsScreen,
                          arguments: CmsDataContent(
                              title: title?.pageTitle ?? cmsData.data?[index].translations?.firstOrNull?.pageTitle??"",
                              id: int.parse(cmsData.data?[index].id ?? ""),
                              index: index));
                    },
                    title:
                    CommonWidgets().getDrawerTileText(title?.pageTitle??cmsData.data?[index].translations?.firstOrNull?.pageTitle??"", context),
                    trailing: Icon(
                        Icons.chevron_right,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                );
              }),
          SizedBox(
            height: AppSizes.buttonHeight,
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, contactUsScreen);
              },
              title:
              CommonWidgets().getDrawerTileText(StringConstants.contactUs.localized().trim(), context),
              trailing: Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

