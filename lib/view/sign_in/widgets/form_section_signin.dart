import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/resources/strings_manager.dart';
import 'package:registration/utils/show_snack_bar.dart';
import 'package:registration/view/sign_in/logic/cubit/login_cubit.dart';
import 'package:registration/view/sign_up/signup_screen.dart';

import '../../../resources/text_style.dart';

import '../../../utils/navigation.dart';
import '../../home/home_screen.dart';
import '../../widgets/costom_text_form_field.dart';
import '../../widgets/text_button_widget.dart';

class FormSectionSignIn extends StatelessWidget {
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FormSectionSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      builder: (context, state) {
        return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CostomTextFormField(
                      controller: emailController,
                      hintText: AppStrings.emailHintText,
                      prefixIcon: Icons.email,
                      obsecureType: false,
                      isObsecureText: false,
                      inputType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CostomTextFormField(
                        controller: passwordController,
                        hintText: AppStrings.password,
                        prefixIcon: Icons.lock,
                        obsecureType: true,
                        isObsecureText: true,
                        inputType: TextInputType.visiblePassword),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgetPassword,
                          style: TextStyles.textStyleRegular12Blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButtonWidget(
                      buttonText: AppStrings.signIn,
                      textStyle: TextStyles.textStyleRegular16White,
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          BlocProvider.of<LoginCubit>(context).login(
                              emailController.text, passwordController.text);
                          _clearFields();
                          NavigationUtils.pushReplacement(
                              context: context, page: HomeScreen());
                        }
                      }),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.donotHaveAccount,
                            style: TextStyles.textStyleRegular16Grey
                                .copyWith(height: 1.5)),
                        GestureDetector(
                          onTap: () {
                            NavigationUtils.pushReplacement(
                                context: context, page: SignUpScreen());

                            // Navigator.pushReplacementNamed(
                            //     context, Routes.signUpScreen);
                          },
                          child: Text(AppStrings.registerDot,
                              style: TextStyles.textStyleRegular16Orange
                                  .copyWith(height: 1.5)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
      listener: (context, state) {
        if (state is LoginLoading) {
          showSnackBar(context, "Loading");
        } else if (state is LoginSuccess) {
          showSnackBar(context, "Success");
        } else if (state is LoginFailure) {
          showSnackBar(context, "Something went wrong, please try again.");
        }
      },
    );
  }

  // Future<void> _login(String email, String password) async {
  //   GetIt.I.get<SharedPreferences>().setString(AppStrings.emailPref, email);
  //   GetIt.I
  //       .get<SharedPreferences>()
  //       .setString(AppStrings.passwordPref, password);
  //   GetIt.I.get<SharedPreferences>().setBool(AppStrings.isLoggedInPref, true);
  //
  //   print("login Successfully.");
  //   _clearFields();
  //   NavigationUtils.pushReplacement(context: context, page: HomeScreen());
  //
  //   // Navigator.pushReplacementNamed(context, Routes.homeScreen);
  // }

  void _clearFields() {
    emailController.clear();
    passwordController.clear();
  }
}
