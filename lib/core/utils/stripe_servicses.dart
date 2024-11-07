import 'package:cheackout_payment/core/utils/api_service.dart';
import 'package:cheackout_payment/core/utils/api_tokens.dart';

import '../../Features/checkout/models/payment/payment.intent.model.dart';
import '../../Features/checkout/models/payment_intent_input_model.dart';

class StripeServicses {
  ApiService apiService = ApiService();
  Future<Payment> initPaymentIntent(
      PatmentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        url: "https://api.stripe.com/v1/payment_intents",
        body: paymentIntentInputModel.tojson(),
        token: ApiTokens.secretKey);
    Payment paymentintent = Payment.fromJson(response.data);
    return paymentintent;
  }
}
