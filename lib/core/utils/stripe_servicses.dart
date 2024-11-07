import 'package:cheackout_payment/core/utils/api_service.dart';
import 'package:cheackout_payment/core/utils/api_tokens.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../Features/checkout/data/models/payment/payment.intent.model.dart';
import '../../Features/checkout/data/models/payment_intent_input_model.dart';

class StripeServicses {
  ApiService apiService = ApiService();
  Future<Payment> initPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiService.post(
        url: "https://api.stripe.com/v1/payment_intents",
        body: paymentIntentInputModel.tojson(),
        token: ApiTokens.secretKey);
    Payment paymentintent = Payment.fromJson(response.data);
    return paymentintent;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Abdulmalek',
      ),
    );
  }

  Future displayPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await initPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
