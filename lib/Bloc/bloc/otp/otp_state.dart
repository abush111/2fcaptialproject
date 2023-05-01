import 'package:equatable/equatable.dart';

abstract class OTPAuthState extends Equatable {
  const OTPAuthState();

  @override
  List<Object> get props => [];
}

class OTPAuthInitial extends OTPAuthState {}

class OTPAuthLoading extends OTPAuthState {}

class OTPAuthSuccess extends OTPAuthState {}

class OTPAuthFailure extends OTPAuthState {
  final String error;

  const OTPAuthFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'OTPAuthFailure { error: $error }';
}