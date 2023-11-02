import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/view_model/data/local/shared_keys.dart';
import 'package:store_app/view_model/data/local/shared_prefernce.dart';
import 'package:store_app/view_model/data/network/dio_helper.dart';
import 'package:store_app/view_model/data/network/end_points.dart';
import 'package:store_app/view_model/utils/functions.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    userNameController.text='mor_2314';
    passwordController.text='83r5^_';
    emit(LoginLoadingState());

    await DioHelper.post(
      endPoint: EndPoints.login,
      body: {
        'username' : userNameController.text,
        'password' : passwordController.text,
      },
    ).then((value) {
      print(value?.data);
      LocalData.set(key: SharedKeys.token, value: value?.data['token']);
      emit(LoginSuccessState());
    }).catchError((error) {
      if(error is DioException){
        print(error.response?.data);
      }
      print(error);
      emit(LoginErrorState());
      throw error;
    });
  }
}
