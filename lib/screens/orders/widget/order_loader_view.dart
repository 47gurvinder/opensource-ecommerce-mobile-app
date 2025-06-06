/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */


import 'package:bagisto_app_demo/screens/orders/utils/index.dart';

class OrderLoader extends StatelessWidget {
  const OrderLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0,8,8,8),
        child: SkeletonLoader(
          highlightColor: Theme.of(context).highlightColor,
          baseColor: Theme.of(context).scaffoldBackgroundColor,
          items: 6,
          builder: Card(
            child: Container(height: 180,),
          ),),
      ),
    );
  }
}
