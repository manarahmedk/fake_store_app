import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/view/components/widgets/text_custom.dart';
import 'package:store_app/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_app/view_model/utils/colors.dart';
import '../../view_model/utils/navigation.dart';
import '../components/widgets/my_text_form_field.dart';
import 'home_screen.dart';


class LoginScreen extends StatelessWidget {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return Column(
                children: [
                  const SizedBox(
                    height: 260,
                  ),
                  TextCustom(
                    text: 'Login',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        MyTextFormField(
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: cubit.userNameController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if ((value ?? '').isEmpty) {
                              return 'Please, Enter your Email';
                            }
                            return null;
                          },
                        ),
                        MyTextFormField(
                          hintText: 'Password',
                          keyboardType: TextInputType.text,
                          controller: cubit.passwordController,
                          suffixIcon: Icons.remove_red_eye,
                          obscureText: obscureText,
                          secondSuffixIcon: Icons.visibility_off,
                          validator: (value) {
                            if ((value ?? '').isEmpty) {
                              return 'Please, Enter your Password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.login().then((value){
                          Navigation.pushAndRemove(context, HomeScreen());
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.blueAccent,
                        minimumSize: const Size(double.infinity, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      child: TextCustom(
                        text: 'Login',
                        fontSize: 15,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextCustom(
                        text: 'Don\'t have an account ?  ',
                        fontSize: 15,
                        color: AppColors.grey,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: TextCustom(
                          text: 'Register',
                          fontSize: 17,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
