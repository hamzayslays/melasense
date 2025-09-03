import 'package:flutter/material.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:melasense/view/auth/login_screen.dart';
import 'package:melasense/view/auth/signup_screen.dart';
import 'package:melasense/view/bottom_nav/bottom_nav.dart';
import 'package:melasense/view/home/test_result_screen.dart';
import 'package:melasense/view/home/view_all_test.dart';
import 'package:melasense/view/messages/messages_screen.dart';
import 'package:melasense/view/notification/notification_screen.dart';
import 'package:melasense/view/onboarding/onboarding_screen.dart';
import 'package:melasense/view/splash/splash_screen.dart';

import '../../view/chatbot_chat_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (ctx) => const OnboardingScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (ctx) => const LoginScreen());
      case RouteNames.signupScreen:
        return MaterialPageRoute(builder: (ctx) => const SignupScreen());
      case RouteNames.bottomNav:
        return MaterialPageRoute(builder: (ctx) => BottomNav());
      case RouteNames.viewAllTest:
        return MaterialPageRoute(builder: (ctx) => ViewAllTest());
      case RouteNames.testResultScreen:
        return MaterialPageRoute(builder: (ctx) => TestResultScreen());
      case RouteNames.messageScreen:
        return MaterialPageRoute(builder: (ctx) => MessagesScreen());
      case RouteNames.notificationScreen:
        return MaterialPageRoute(builder: (ctx) => NotificationScreen());
        case RouteNames.chatbotScreen:
        return MaterialPageRoute(builder: (ctx) => ChatbotChatScreen());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(body: Center(child: Text('No routes Found')));
          },
        );
    }
  }
}
