import 'package:sr_edu_care/core/constants/app_assets.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/widgets/custom_textfield.dart';

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
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Image.asset(whiteLogo),

            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
            ),
            Gap(10.h),
            //email text field
            customTextField(
              controller: emailController,
              hintText: "Enter your email",
              prefixIcon: Icons.email_outlined,
            ),
            Gap(10.h),
            //password text field
            customTextField(
              controller: passwordController,
              hintText: "Enter your password",
              prefixIcon: Icons.lock_outline,
            ),
          ],
        ),
      ),
    );
  }
}
