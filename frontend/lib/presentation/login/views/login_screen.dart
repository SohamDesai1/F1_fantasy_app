import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/login/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go('/');
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              _buildLoginForm(),
              if (state is AuthLoading)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.w,
                  fontFamily: 'Formula1Wide'),
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Name",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 70.w,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Enter Password",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 70.w,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        SizedBox(
          height: 6.h,
        ),
        Container(
          height: 6.h,
          width: 70.w,
          decoration: BoxDecoration(
              color: Color(0xFFF50304),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white)),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 25.w,
              child: Divider(),
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              "OR",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 3.w,
            ),
            SizedBox(
              width: 25.w,
              child: Divider(),
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.read<AuthCubit>().signInWithGoogle();
              },
              child: Container(
                height: 6.h,
                width: 20.w,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white)),
                child: Center(child: Icon(Ionicons.logo_google)),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              height: 6.h,
              width: 20.w,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white)),
              child: Center(child: Icon(Ionicons.logo_facebook)),
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Account Yet?',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              'Sign Up',
              style: TextStyle(color: Color(0xFFF50304)),
            )
          ],
        ),
      ],
    );
  }
}
