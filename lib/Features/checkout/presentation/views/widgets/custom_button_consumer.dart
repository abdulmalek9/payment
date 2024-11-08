import 'package:cheackout_payment/Features/checkout/presentation/manger/cubit/payment_cubit_cubit.dart';
import 'package:cheackout_payment/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';

class CustomButtonConsumer extends StatelessWidget {
  const CustomButtonConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
        listener: (context, state) {
          if (state is PaymentCubitSuccsess) {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const ThankYouView();
              },
            ));
          }
          if (state is PaymentCubitFailure) {
            SnackBar snackBar =
                SnackBar(content: Center(child: Text(state.errMessage)));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) => CustomButton(
              text: 'Continue',
              isLoading: state is PaymentCubitLoading ? true : false,
            ));
  }
}
