import 'package:get/get.dart';
import 'package:shoe_app/app/modules/auth/forget_password_page.dart';
import 'package:shoe_app/app/modules/auth/sign_in_page.dart';
import 'package:shoe_app/app/modules/auth/sign_up_page.dart';
import 'package:shoe_app/app/modules/auth/verification_page.dart';
import 'package:shoe_app/app/modules/cart/my_cart_page.dart';
import 'package:shoe_app/app/modules/landingPage/landing_page.dart';
import 'package:shoe_app/app/modules/notification/notification_page.dart';
import 'package:shoe_app/app/modules/onboarding/onboarding_page.dart';
import 'package:shoe_app/app/modules/profile/profile_page.dart';
import 'package:shoe_app/app/modules/starting/starting_page.dart';
import 'package:shoe_app/app/modules/welcome/welcome_page.dart';

class AppRoutes {
  static String startingPage = '/';
  static String onboardingPage = '/onboarding-page';
  static String signUp = '/sign-up';
  static String signIn = '/sign-in';
  static String forgetPassword = '/forget-password';
  static String verificationPage = '/verification-page';
  static String welcomePage = '/welcome-page';
  static String landingPage = '/landing-page';
  static String cartPage = '/cart-page';
  static String notificationPage = '/notification-page';
  static String profilePage = '/profile-page';

  static String getStartingPageRoute() => startingPage;
  static String getOnboardingPageRoute() => onboardingPage;
  static String getSignUpPageRoute() => signUp;
  static String getSignInPageRoute() => signIn;
  static String getForgetPasswordPageRoute() => forgetPassword;
  static String getVerificationPageRoute() => verificationPage;
  static String getWelcomePageRoute() => welcomePage;
  static String getLandingPageRoute() => landingPage;
  static String getCartPageRoute() => cartPage;
  static String getNotificationPageRoute() => notificationPage;
  static String getProfilePageRoute() => profilePage;

  static List<GetPage> routes = [
    GetPage(name: startingPage, page: () => const StartingPage()),
    GetPage(name: onboardingPage, page: () => const OnboardingPage()),
    GetPage(name: signUp, page: () => const SignUpPage()),
    GetPage(name: signIn, page: () => const SignInPage()),
    GetPage(name: forgetPassword, page: () => const ForgetPasswordPage()),
    GetPage(name: verificationPage, page: () => const VerificationPage()),
    GetPage(name: welcomePage, page: () => const WelcomePage()),
    GetPage(name: landingPage, page: () => const LandingPage()),
    GetPage(name: cartPage, page: () => const MyCartPage()),
    GetPage(name: notificationPage, page: () => const NotificationPage()),
    GetPage(name: profilePage, page: () => const ProfilePage()),
  ];
}
