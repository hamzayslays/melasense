import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/util/routes/routes.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:melasense/view/learn/education_hub_screen.dart';
import 'package:melasense/viewmodel/education_hub_vm/education_hub_vm.dart';
import 'package:melasense/viewmodel/onboarding_vm/onboarding_vm.dart';
import 'package:melasense/viewmodel/test_vm/schedule_appointment_vm.dart';
import 'package:melasense/viewmodel/test_vm/test_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingVm()),
        ChangeNotifierProvider(create: (_) => TestViewModel()),
        ChangeNotifierProvider(create: (_) => ScheduleViewModel()),
        ChangeNotifierProvider(create: (_) => EducationHubVM()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Melasense',
            theme: ThemeData(primaryColor: AppColor.primaryColor),
            initialRoute: RouteNames.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
