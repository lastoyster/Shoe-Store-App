import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/auth/components/auth_field.dart';
import 'package:shoe_app/app/modules/auth/components/remember_me_checkbox.dart';
import 'package:shoe_app/app/modules/auth/components/social_button.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';
import 'package:shoe_app/app/routes/app_routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isRemember = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 56.h),
              Center(child: Text('Sign Up', style: AppTypography.kBold24)),
              SizedBox(height: 5.h),
              Text('Welcome back! Please enter your details',
                  style: AppTypography.kExtraLight14),
              SizedBox(height: 68.h),
              AuthField(
                  iconColor: AppColors.kApricot,
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  icon: AppAssets.kUser,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Full Name';
                    } else if (value.contains(RegExp(r'[0-9]'))) {
                      return 'Full Name should not contain digits';
                    }
                    return null;
                  },
                  hintText: 'Full Name'),
              SizedBox(height: 16.h),
              AuthField(
                  iconColor: AppColors.kLavender,
                  controller: _mailController,
                  keyboardType: TextInputType.emailAddress,
                  icon: AppAssets.kMail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!value.isEmail) {
                      return 'Please enter a valid email address';
                    }

                    return null;
                  },
                  hintText: 'Email address'),
              SizedBox(height: 16.h),
              AuthField(
                  iconColor: AppColors.kPeriwinkle,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  icon: AppAssets.kLock,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (!_isPasswordStrong(value)) {
                      return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.';
                    }
                    return null;
                  },
                  hintText: 'Password'),
              SizedBox(height: 14.h),
              RememberMeCheckbox(
                onRememberChanged: (value) {
                  setState(() {
                    isRemember = value;
                  });
                },
              ),
              SizedBox(height: 95.h),
              PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed(AppRoutes.getWelcomePageRoute());
                    }
                  },
                  text: 'Sign Up'),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text('Already have an account',
                      style: AppTypography.kMedium14),
                  const Spacer(),
                  PrimaryButton(
                    onTap: () {
                      Get.toNamed(AppRoutes.getSignInPageRoute());
                    },
                    text: 'Sign IN',
                    height: 30.h,
                    width: 70.w,
                    fontColor: AppColors.kPrimary,
                    btnColor: isDarkMode(context)
                        ? AppColors.kLightWhite2.withOpacity(0.2)
                        : AppColors.kLightWhite2,
                    fontSize: 12.sp,
                  )
                ],
              ),
              SizedBox(height: 56.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(onTap: () {}, icon: AppAssets.kFacebook),
                  SizedBox(width: 31.w),
                  SocialButton(onTap: () {}, icon: AppAssets.kGoogle),
                  SizedBox(width: 31.w),
                  SocialButton(
                    onTap: () {},
                    icon: AppAssets.kApple,
                    iconColor: isDarkMode(context)
                        ? AppColors.kLightWhite
                        : AppColors.kBlack,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _isPasswordStrong(String password) {
    if (password.length < 8) {
      return false;
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }
}
