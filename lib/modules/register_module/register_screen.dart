import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:traveler/layout/traveler_cubit/traveler_layout.dart';
import 'package:traveler/modules/login_module/login_screen.dart';
import 'package:traveler/modules/register_module/register_cubit/cubit.dart';
import 'package:traveler/modules/register_module/register_cubit/state.dart';
import 'package:traveler/shared/components/components.dart';
import 'package:traveler/shared/style/icon_broken.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            navigateAndFinish(context, TravelerScreen());
          }
        },
        builder: (context, state) {
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
                          'Hi There!',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'You get in in the right place! ',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 16.0,
                              ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'User name is incorrect';
                            }
                          },
                          label: 'Username',
                          prefix: IconBroken.Profile,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
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
                          isPassword: RegisterCubit.get(context).isPassword,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: IconBroken.Lock,
                          suffix: RegisterCubit.get(context).suffix,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            controller: rePasswordController,
                            isPassword: RegisterCubit.get(context).isPassword,
                            type: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value != passwordController.text) {
                                return 'password didn\'t match';
                              }else{
                                return null;
                              }
                            },
                            label: 'confirm Password',
                            prefix: IconBroken.Lock,
                            suffix: RegisterCubit.get(context).suffix,
                            suffixPressed: () {
                              RegisterCubit.get(context)
                                  .changePasswordVisibility();
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultBottom(
                          width: 100,
                          isUpperCase: true,
                          radius: 25.0,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: 'Sign up',
                          background: HexColor("#4361EE"),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Have an account?',
                            ),
                            defaultTextBottom(
                              function: () {
                                navigateTo(context, LoginScreen());
                              },
                              text: 'Sign in',
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
