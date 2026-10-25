import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/auth_helper.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class SubmitLogin extends LoginEvent {
  final String mobile;
  const SubmitLogin(this.mobile);
}

class LoginState {
  final bool loading;
  final String? error;
  const LoginState({this.loading = false, this.error});
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<SubmitLogin>((event, emit) async {
      if (event.mobile.length < 10) {
        emit(const LoginState(error: 'invalid'));
        return;
      }
      emit(const LoginState(loading: true));
      await AuthHelper.saveMobile(event.mobile);
      emit(const LoginState());
    });
  }
}
