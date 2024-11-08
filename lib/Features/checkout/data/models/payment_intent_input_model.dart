class PaymentIntentInputModel {
  final String currency;
  final String amount;

  PaymentIntentInputModel({required this.currency, required this.amount});

  tojson() {
    return {'amount': "${amount}00", 'cuurency': currency};
  }
}
