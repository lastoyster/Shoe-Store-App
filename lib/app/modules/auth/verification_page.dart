import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/auth/components/otp_textfield.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Center(child: Text('Verify', style: AppTypography.kBold24)),
            SizedBox(height: 5.h),
            Text('Check your email and enter code',
                style: AppTypography.kExtraLight14),
            SizedBox(height: 68.h),
            OTPField(onChanged: (value) {}, controller: _otpController)
          ],
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20.h),
        child: PrimaryButton(onTap: () {}, text: 'Continue'),
      ),
    );
  }
}
