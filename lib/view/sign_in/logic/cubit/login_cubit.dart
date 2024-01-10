import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../resources/strings_manager.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      await GetIt.I.get<SharedPreferences>().setString(AppStrings.emailPref, email);
      GetIt.I
          .get<SharedPreferences>()
          .setString(AppStrings.passwordPref, password);
      GetIt.I.get<SharedPreferences>().setBool(AppStrings.isLoggedInPref, true);

      print("login Successfully.");
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailure());
    }

  }
}
