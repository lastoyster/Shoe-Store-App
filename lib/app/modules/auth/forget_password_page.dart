import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/auth/components/auth_field.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';
import 'package:shoe_app/app/routes/app_routes.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                  child:
                      Text('Enter Your Email', style: AppTypography.kBold24)),
              SizedBox(height: 5.h),
              Text('Enter your email and accept a code',
                  style: AppTypography.kExtraLight14),
              SizedBox(height: 68.h),
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
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20.h),
        child: PrimaryButton(
            onTap: () {
              if(_formKey.currentState!.validate()){
                Get.toNamed(AppRoutes.getVerificationPageRoute());
              }
            },
            text: 'Continue'),
      ),
    );
  }
}
