enum PaymentMethodEnum {
  masterCard,
  googlePay,
  paypal;
}

extension PaymentMEExt on PaymentMethodEnum {
  String get image => "";

  
  String get title {
    return switch (this) {
      PaymentMethodEnum.masterCard => "Master card",
      PaymentMethodEnum.googlePay => "Google pay",
      PaymentMethodEnum.paypal => "PayPal",
    };
  }
}
