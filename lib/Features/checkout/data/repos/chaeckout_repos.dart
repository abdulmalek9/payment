import 'package:cheackout_payment/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../models/payment_intent_input_model.dart';

abstract class ChaeckoutRepos {
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
