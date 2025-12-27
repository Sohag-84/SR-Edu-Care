import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sr_edu_care/core/constants/app_assets.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/utils/utils.dart';
import 'package:sr_edu_care/core/widgets/custom_button.dart';
import 'package:sr_edu_care/core/widgets/custom_textfield.dart';
import 'package:sr_edu_care/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:sr_edu_care/routes/app_routes.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.w),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              eassyLoading();
            } else {
              EasyLoading.dismiss();
            }
            if (state is LoginSuccess) {
              Fluttertoast.showToast(msg: state.message);
              context.goNamed(AppRoutes.home.name);
            }
            if (state is LoginFailure) {
              Fluttertoast.showToast(msg: state.errorMessage);
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: .center,
              children: [
                Gap(kTextTabBarHeight + 20),
                Image.asset(whiteLogo),

                Text(
                  welcome,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(30.h),
                //email text field
                customTextField(
                  controller: emailController,
                  hintText: emailHint,
                  prefixIcon: Icons.email_outlined,
                ),
                Gap(20.h),
                //password text field
                customTextField(
                  controller: passwordController,
                  hintText: passwordHint,
                  prefixIcon: Icons.lock_outline,
                ),
                Gap(5.h),

                //forget password
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    forgetPassword,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: orangeColor,
                      decoration: TextDecoration.underline,
                      decorationColor: orangeColor,
                    ),
                  ),
                ),
                Gap(20.h),

                //login button
                customButton(
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Please enter your email");
                      return;
                    }
                    if (passwordController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Please enter your password");
                      return;
                    }
                    context.read<AuthBloc>().add(
                      LoginEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  },
                  btnText: login,
                ),
                Gap(10.h),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      dontHaveAccount,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRoutes.register.name);
                      },
                      child: Text(
                        " $signup",
                        style: TextStyle(fontSize: 14.sp, color: orangeColor),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
