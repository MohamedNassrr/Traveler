import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:traveler/layout/traveler_cubit/traveler_layout.dart';
import 'package:traveler/modules/login_module/login_cubit/cubit.dart';
import 'package:traveler/modules/login_module/login_cubit/state.dart';
import 'package:traveler/modules/register_module/register_screen.dart';
import 'package:traveler/shared/components/components.dart';
import 'package:traveler/shared/network/local/cache_helper.dart';
import 'package:traveler/shared/style/icon_broken.dart';

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state){
          if(state is LoginSuccessState){
            CacheHelper.saveData(
                key: 'uId',
               value: state.uId,
            );
            navigateAndFinish(context,
                TravelerScreen()
            );
          }
        },
        builder: (context, state){
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello Again!',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Welcome back you\'ve been missed!',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value){
                            if(value.isEmpty){
                              return 'Email Address is Incorrect';
                            }
                          },
                          label: 'Email Address',
                          prefix: IconBroken.Message,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          isPassword: LoginCubit.get(context).isPassword,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: IconBroken.Lock,
                          suffix: LoginCubit.get(context).suffix,
                          onSubmit: (value){
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                          suffixPressed: (){
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => defaultBottom(
                              width: 100,
                              isUpperCase: false,
                              radius: 25.0,
                              function: () {
                                if(formKey.currentState!.validate()){
                                  LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'Login',
                              background: HexColor("#4361EE"),
                            ),
                            fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text(
                              'New to our app ?',
                            ),
                            defaultTextBottom(
                              function: (){
                                navigateTo(context, RegisterScreen(),);
                              },
                              text: 'Sign Up',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
