import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:melasense/util/routes/routes.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:melasense/viewmodel/onboarding_vm/onboarding_vm.dart';
import 'package:melasense/viewmodel/test_vm/view_all_test_vm.dart';
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
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Melasense',
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: RouteNames.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
