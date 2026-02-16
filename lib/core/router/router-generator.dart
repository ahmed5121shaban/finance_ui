import 'package:finance_ui/core/router/router-paths.dart';
import 'package:finance_ui/core/screens/create-new-password-screen.dart';
import 'package:finance_ui/core/screens/forgot-password-screen.dart';
import 'package:finance_ui/core/screens/on-boarding-screen.dart';
import 'package:finance_ui/core/screens/login-screen.dart';
import 'package:finance_ui/core/screens/main-screen.dart';
import 'package:finance_ui/core/screens/not-found-screen.dart';
import 'package:finance_ui/core/screens/otp-verification-screen.dart';
import 'package:finance_ui/core/screens/password-changed-screen.dart';
import 'package:finance_ui/core/screens/profile-screen.dart';
import 'package:finance_ui/core/screens/register-screen.dart';
import 'package:finance_ui/core/screens/screens.dart';
import 'package:go_router/go_router.dart';

class RouterGenerator {
  static GoRouter generateRoute = GoRouter(
    errorBuilder: (context, state) => const NotFoundScreen(),
    initialLocation: RouterPaths.onBoarding,
    routes: [
      GoRoute(
        path: RouterPaths.onBoarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: RouterPaths.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouterPaths.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: RouterPaths.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: RouterPaths.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: RouterPaths.createNewPassword,
        builder: (context, state) => const CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: RouterPaths.passwordChanged,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      GoRoute(
        path: RouterPaths.otpVerification,
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      GoRoute(
        path: RouterPaths.screens,
        builder: (context, state) => const Screens(),
      ),
      GoRoute(
        path: RouterPaths.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}