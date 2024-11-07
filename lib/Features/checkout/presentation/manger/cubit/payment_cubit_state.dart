part of 'payment_cubit_cubit.dart';

@immutable
sealed class PaymentCubitState {}

final class PaymentCubitInitial extends PaymentCubitState {}

final class PaymentCubitLoading extends PaymentCubitState {}

final class PaymentCubitSuccsess extends PaymentCubitState {}

final class PaymentCubitFailure extends PaymentCubitState {
  final String errMessage;

  PaymentCubitFailure({required this.errMessage});
}
