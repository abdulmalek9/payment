import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cheackout_payment/Features/checkout/data/repos/chaeckout_repos.dart';
import 'package:meta/meta.dart';

import '../../../data/models/payment_intent_input_model.dart';

part 'payment_cubit_state.dart';

class PaymentCubitCubit extends Cubit<PaymentCubitState> {
  PaymentCubitCubit(this.chaeckoutRepos) : super(PaymentCubitInitial());
  final ChaeckoutRepos chaeckoutRepos;
  makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentCubitLoading());
    var response = await chaeckoutRepos.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    response.fold(
        (left) => emit(PaymentCubitFailure(errMessage: left.errorMessage)),
        (right) => emit(PaymentCubitSuccsess()));
  }

  @override
  void onChange(Change<PaymentCubitState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
