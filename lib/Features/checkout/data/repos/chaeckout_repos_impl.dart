import 'package:cheackout_payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:cheackout_payment/Features/checkout/data/repos/chaeckout_repos.dart';
import 'package:cheackout_payment/core/errors/failures.dart';
import 'package:cheackout_payment/core/utils/stripe_servicses.dart';
import 'package:dartz/dartz.dart';

class ChaeckoutReposImpl extends ChaeckoutRepos {
  StripeServicses stripeServicses = StripeServicses();
  @override
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeServicses.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
