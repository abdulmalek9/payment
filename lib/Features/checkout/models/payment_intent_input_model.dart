class PatmentIntentInputModel {
  final String currency;
  final String amount;

  PatmentIntentInputModel({required this.currency, required this.amount});

  tojson() {
    return {'amount': amount, 'cuurency': currency};
  }
}
