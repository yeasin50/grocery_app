import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';
import 'package:grocery_app/src/presentation/payment/widgets/add_card_form.dart';
import '../../infrastructure/enums/payment_method_enum.dart';
import '../_common/_common.dart';

class AddPaymentMethodPage extends StatefulWidget {
  const AddPaymentMethodPage({
    super.key,
    required this.type,
  });

  final PaymentMethodEnum type;

  @override
  State<AddPaymentMethodPage> createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundView(
      bubble: const [BackgroundBubble(alignment: Alignment(1.75, 0))],
      child: Scaffold(
        appBar: AppBar(
          title: const LabelView(label: "Payment Details"),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            ///
            Row(
              children: [
                const Radio(
                  value: true,
                  groupValue: true,
                  toggleable: false,
                  onChanged: null,
                  fillColor: WidgetStatePropertyAll(AppTheme.primary),
                ),
                SizedBox(
                  height: 100,
                  width: 150,
                  child: Placeholder(),
                )
              ],
            ),
            const SizedBox(height: 24),
            AddPaymentForm(),
          ],
        ),
      ),
    );
  }
}
