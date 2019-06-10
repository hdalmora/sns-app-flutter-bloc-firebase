import 'dart:async';
import 'package:buddies_osaka/src/utils/Strings.dart';
import 'package:buddies_osaka/src/utils/Validator.dart';
import 'package:buddies_osaka/src/resources/Repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationBloc {
  final _repository = Repository();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();

  Observable<String> get email =>
      _email.stream.transform(_validateEmail);

  Observable<String> get password =>
      _password.stream.transform(_validatePassword);

  Observable<bool> get signInStatus => _isSignedIn.stream;

  String get emailAddress => _email.value;

  // Change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(bool) get showProgressBar => _isSignedIn.sink.add;

  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (Validator.validateEmail(email)) {
      sink.add(email);
    } else {
      sink.addError(StringConstant.emailValidateMessage);
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (Validator.validatePassword(password)) {
      sink.add(password);
    } else {
      sink.addError(StringConstant.passwordValidateMessage);
    }
  });

  Future<void> signInUserAnonymously() {
    return _repository.signInAnonymously();
  }

  Future<int> signInUser() {
    return _repository.signInWithEmailAndPassword(
        _email.value, _password.value);
  }

  Future<int> registerUser() {
    return _repository.signUpWithEmailAndPassword(
        _email.value, _password.value);
  }

  Future<void> signOut() => _repository.signOut();

  void dispose() async {
    await _email.drain();
    _email.close();
    await _password.drain();
    _password.close();
    await _isSignedIn.drain();
    _isSignedIn.close();
  }

  bool validateFields() {
    if (_email.value != null &&
        _email.value.isNotEmpty &&
        _email.value.contains("@") &&
        _password.value != null &&
        _password.value.isNotEmpty &&
        _email.value.contains('@') &&
        _password.value.length > 5) {
      return true;
    } else {
      return false;
    }
  }
}
