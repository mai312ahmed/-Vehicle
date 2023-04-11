import 'package:car_store/core/utilis/app_routers.dart';
import 'package:car_store/core/utilis/assets.dart';
import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/core/utilis/style.dart';
import 'package:car_store/core/widgets/buttons.dart';
import 'package:car_store/cubits/registraition_cubit/registraition_cubit.dart';
import 'package:car_store/features/auth/custom_text_field.dart';
import 'package:car_store/features/auth/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginViewBody extends StatelessWidget {
  String? email;
  String? passWord;
  String? cPassWord;
  String? userName;
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistraitionCubit, RegistraitionState>(
        listener: (context, state) {
      if (state is LoginSuccess) {
        isLoading = false;
        GoRouter.of(context).pushReplacement(AppRouters.home);
      } else if (state is LoginFailuar) {
        isLoading = false;
        showSnackBar(context, state.error);
      } else if (state is LoginProgress) {
        isLoading = true;
      }
    }, builder: (context, state) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      return CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Padding(
                padding: EdgeInsets.only(
                    top: height * .1, left: width * .05, right: width * .05),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AssetsData.logo,
                      ),
                      Text("HI!",
                          style: darkMode
                              ? Styles.textStyle60W900D
                              : Styles.textStyle60W900L),
                      Text("Welcome ",
                          style: darkMode
                              ? Styles.textStyle60W900D
                              : Styles.textStyle60W900L),
                      const Text("Please enter your details",
                          style: Styles.textnormal),
                      SizedBox(height: height * .08),
                      CustomTextFormField(
                        hint: 'Enter your email',
                        maxLines: 2,
                        text: 'Email',
                        onChange: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "field is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        hint: 'Enter your password',
                        maxLines: 2,
                        text: 'Password',
                        onChange: (value) {
                          passWord = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "field is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GeneralButton(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            BlocProvider.of<RegistraitionCubit>(context)
                                .loginUser(email: email, password: passWord);
                          }
                        },
                        text: "Login",
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Dont't have an accunt? ",
                              style: Styles.textnormal),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context).push(AppRouters.singup);
                            },
                            child: const Text(
                              "Sign Up ",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ]);
    });
  }
}
