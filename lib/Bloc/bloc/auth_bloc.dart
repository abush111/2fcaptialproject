import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../Repository/auth.dart';
import '../../Repository/auth_error.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppStateLoggedOut(isLoading: false, successful: false)) {
    on<AppEventLogIn>((event, emit) async {
      emit(AppStateLoggedIn(isLoading: true, successful: false));
      try {
        await Auth().signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(AppStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
        } else if (e.code == 'email-already-in-use') {
        } else if (e.code == 'user-not-found') {
        } else if (e.code == 'wrong-password') {}

        print(e.code); //Add this line to see other firebase exceptions.
      } catch (e) {
        print(e);
      }
    });

    on<AppEventLogOut>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().signOut();
        emit(AppStateLoggedOut(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {}
    });

    on<AppEventRegister>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(AppStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorRegister = e.toString();
        emit(AppStateLoggedOut(isLoading: false, successful: false));
      }
    });

    on<AppEventResetPassword>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().sendResetPasswordEmail(email: event.email);
        emit(AppStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorlogin = e.toString();
        emit(AppStateLoggedOut(isLoading: false, successful: false));
      }
    });
  }
}
