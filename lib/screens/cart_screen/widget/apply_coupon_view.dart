
/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

import '../utils/cart_index.dart';

class ApplyCouponView extends StatefulWidget {
  final CartModel? cartDetailsModel;
  final CartScreenBloc? cartScreenBloc;
  final TextEditingController  discountController;



  const ApplyCouponView({super.key, this.cartDetailsModel, this.cartScreenBloc,required this.discountController});

  @override
  State<ApplyCouponView> createState() => _ApplyCouponViewState();
}

class _ApplyCouponViewState extends State<ApplyCouponView> {
  bool  showButton=false;
  final _discountCouponFormKey = GlobalKey<FormState>();
  final bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data:Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          iconColor: Colors.grey,
          title: Text(
            StringConstants.applyCode.localized(),
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spacingNormal,
                  vertical: AppSizes.spacingLarge
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Form(
                      key: _discountCouponFormKey,
                      autovalidateMode: _autoValidate
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: CommonWidgets().getTextField(
                          context,
                          widget.discountController,
                        StringConstants.cartPageEnterDiscountCodeLabel
                              .localized(),
                          label: StringConstants.couponCode
                              .localized(),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: AppSizes.spacingMedium),
                        validator: (discountCode) {
                        if ((discountCode?.trim() ?? "").isEmpty) {
                          setState(() {
                            showButton = true;
                          });
                          return StringConstants.couponEmpty.localized();
                        }
                        return null;
                      },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: AppSizes.spacingNormal,bottom: showButton? AppSizes.spacingWide:0,right: 3),
                      child: MaterialButton(
                        height: AppSizes.buttonHeight+5,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground,
                        textColor: Theme.of(context)
                            .colorScheme.background,
                        elevation: 0.0,
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.spacingSmall),
                        ),
                        onPressed: () {
                          if (_discountCouponFormKey.currentState!.validate()) {
                            setState(() {
                              showButton=false;
                            });
                            if (widget.cartDetailsModel?.couponCode ==
                                null) {
                              widget.cartScreenBloc?.add(
                                  AddCouponCartEvent(
                                      widget.discountController.text));
                            } else {
                              widget.cartScreenBloc?.add(
                                  RemoveCouponCartEvent(
                                      widget.cartDetailsModel));
                              widget.discountController.text = "";
                            }
                          }
                        },
                        child: widget.cartDetailsModel?.couponCode ==
                            null ||
                            widget.cartDetailsModel?.couponCode ==
                                ''
                            ? Text(
                          StringConstants.apply.localized().toUpperCase(),
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.background
                          ),
                        )
                            : Text(StringConstants.remove.localized()),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
