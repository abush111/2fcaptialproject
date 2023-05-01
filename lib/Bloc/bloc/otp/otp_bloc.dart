import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Bloc/bloc/otp/otp_event.dart';
import 'package:meta/meta.dart';

import 'otp_state.dart';

class OTPAuthBloc extends Bloc<OTPAuthEvent, OTPAuthState> {
  final FirebaseAuth _firebaseAuth;

  OTPAuthBloc({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth,
        super(OTPAuthInitial());

  @override
  Stream<OTPAuthState> mapEventToState(
    OTPAuthEvent event,
  ) async* {
    if (event is VerifyOTPPressed) {
      yield OTPAuthLoading();
      on<VerifyOTPPressed>(event, emit) async {
        emit(OTPAuthLoading());
      }

      try {
        await _firebaseAuth.signInWithCredential(
          PhoneAuthProvider.credential(
            verificationId: event.verificationCode,
            smsCode: event.phoneNumber,
          ),
        );
        yield OTPAuthSuccess();
      } catch (error) {
        yield OTPAuthFailure(error: error.toString());
      }
    } else if (event is ResendOTP) {
      yield OTPAuthLoading();
      try {
        await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: event.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {},
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
        yield OTPAuthInitial();
      } catch (error) {
        yield OTPAuthFailure(error: error.toString());
      }
    }
  }
}
