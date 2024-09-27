import 'package:chatapp/consts.dart';
import 'package:chatapp/cubits/registercubit/register_cubit.dart';
import 'package:chatapp/views/chatview.dart';
import 'package:chatapp/views/loginview.dart';
import 'package:chatapp/views/registerview.dart';
import 'package:chatapp/widgets/custombutton.dart';
import 'package:chatapp/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatelessWidget {
  RegisterView({
    super.key,
  });
  static String id = 'registerview';
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is RegisterSuccessState) {
            Navigator.pushNamed(context, Chatview.id);
          } else if (state is RegisterFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errormessage)));
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is RegisterLoadingState ? true : false,
            child: Scaffold(
              backgroundColor: kPrimaryColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Image.asset('assets/images/scholar.png'),
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Pacifico'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontFamily: 'Pacifico'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      onchanged: (p0) {
                        email = p0;
                      },
                      hint: 'Email',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onchanged: (p0) {
                          password = p0;
                        },
                        hint: 'Password'),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () {
                        BlocProvider.of<RegisterCubit>(context).register(
                            emailAddress: email!, password: password!);
                      },
                      text: 'Register',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You already have an account?',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LoginView.id);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
