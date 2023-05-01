import 'package:equatable/equatable.dart';

abstract class OTPAuthEvent extends Equatable {
  const OTPAuthEvent();

  @override
  List<Object> get props => [];
}

class VerifyOTPPressed extends OTPAuthEvent {
  final String phoneNumber;
  final String verificationCode;

  const VerifyOTPPressed({required this.phoneNumber, required this.verificationCode});

  @override
  List<Object> get props => [phoneNumber, verificationCode];

  @override
  String toString() {
    return 'VerifyOTPPressed { phoneNumber: $phoneNumber, verificationCode: $verificationCode }';
  }
}

class ResendOTP extends OTPAuthEvent {
  final String phoneNumber;

  const ResendOTP({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];

  @override
  String toString() {
    return 'ResendOTP { phoneNumber: $phoneNumber }';
  }
}