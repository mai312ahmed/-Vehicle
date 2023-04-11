import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'registraition_state.dart';

class RegistraitionCubit extends Cubit<RegistraitionState> {
  RegistraitionCubit() : super(RegistraitionInitial());

  Future<void> loginUser({required email, required password}) async {
    emit(LoginProgress());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
        emit(LoginFailuar(
            error:
                "your email is not active we will send the verify code again please check your email"));
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      } else {
        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailuar(error: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailuar(error: 'wrong password'));
      }
    } on Exception catch (e) {
      emit(LoginFailuar(error: e.toString()));
    }
  }

  Future<void> signupUser({required email, required password}) async {
    emit(SignupProgress());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailure(error: 'The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailure(error: 'An account already exists for that email'));
      } else if (e.code == "invalid-email") {
        emit(SignupFailure(error: "The  email is invalid"));
      }
    } catch (ex) {
      emit(SignupFailure(error: ex.toString()));
    }
  }
}
