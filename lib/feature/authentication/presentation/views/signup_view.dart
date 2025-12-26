import 'package:go_router/go_router.dart';
import 'package:sr_edu_care/core/constants/app_assets.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/widgets/custom_button.dart';
import 'package:sr_edu_care/core/widgets/custom_textfield.dart';
import 'package:sr_edu_care/routes/app_routes.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
          children: [
            Gap(kTextTabBarHeight),
            Image.asset(whiteLogo),

            Text(
              createAccount,
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
            ),
            Gap(30.h),
            //name text field
            customTextField(
              controller: nameController,
              hintText: nameHint,
              prefixIcon: Icons.person_2_outlined,
            ),
            Gap(20.h),
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
            Gap(30.h),

            //login button
            customButton(onTap: () {}, btnText: signup),
            Gap(10.h),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  alreadyHaveAccount,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRoutes.login.name);
                  },
                  child: Text(
                    " $login",
                    style: TextStyle(fontSize: 14.sp, color: orangeColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
