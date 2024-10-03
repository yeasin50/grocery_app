import 'package:flutter/material.dart';
import 'package:grocery_app/src/infrastructure/models/user_payment_method.dart';
import 'package:grocery_app/src/presentation/_common/_common.dart';
import 'package:grocery_app/src/presentation/_common/widgets/background_view.dart';
import 'package:grocery_app/src/presentation/payment/widgets/payment_card_view.dart';
import 'package:grocery_app/src/presentation/payment/widgets/saved_card_view.dart';

import '../../infrastructure/infrastructure.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.total,
  });
  final double total;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentMethodEnum selectedMethod = PaymentMethodEnum.masterCard;

  List<UserPaymentMethod> savedItems = [
    UserPaymentMethod.ui,
    UserPaymentMethod.ui,
    UserPaymentMethod.ui,
  ];

  UserPaymentMethod selectedUserAccount = UserPaymentMethod.ui;

  double total = 20;

  @override
  Widget build(BuildContext context) {
    return BackgroundView.two(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24),
                children: [
                  AppBar(
                    title: const LabelView(label: "Payment method"),
                    centerTitle: true,
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: PaymentMethodEnum.values
                        .map(
                          (e) => PaymentCardView(
                            isSelected: selectedMethod == e,
                            type: e,
                            onTap: () {
                              ///
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  for (final um in savedItems) //
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: UserSavedItemView(
                        info: um,
                        isSelected: selectedUserAccount == um,
                        onTap: () {
                          selectedUserAccount = um;
                          setState(() {});
                        },
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:\$${total.toStringAsFixed(1)}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  AppButton(label: "Pay Now", onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
