import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_navigation.dart';
import 'login_page.dart';
import 'controllers/home_controller.dart';
import 'controllers/navigation_controller.dart';
import 'controllers/dashboard_controller.dart';
import 'controllers/profile_controller.dart';
import 'controllers/auth_controller.dart';

void main() {
  // Initialize GetX controllers
  Get.put(ProfileController());
  Get.put(AuthController());
  Get.put(NavigationController());
  Get.put(HomeController());
  Get.put(DashboardController());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Main application widget that sets up the MaterialApp
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Personal Profile App',
      theme: ThemeData(
        // Modern theme with blue accent colors
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    
    return Obx(() => authController.isLoggedIn.value 
        ? const MainNavigation() 
        : const LoginPage());
  }
}
