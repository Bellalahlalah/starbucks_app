import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ต้อง import ทั้ง package
import 'package:starbucks_app/controller/theme_controller.dart';
import 'package:starbucks_app/service/user_service.dart';
import 'package:starbucks_app/pages/account_screen.dart';
import 'package:starbucks_app/pages/card_screen.dart';
import 'package:starbucks_app/pages/home_screen.dart';
import 'package:starbucks_app/pages/inbox_screen.dart';
import 'package:starbucks_app/pages/order_address_screen.dart';
import 'package:starbucks_app/pages/order_scan_qr_screen.dart';
import 'package:starbucks_app/pages/order_store_list_screen.dart';
import 'package:starbucks_app/pages/sign_in.dart';
import 'package:starbucks_app/controller/bottom_nav_controller.dart';
import 'package:starbucks_app/pages/order_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:starbucks_app/controller/language_controller.dart';
import 'package:starbucks_app/localization/app_translations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(UserService()); // ลงทะเบียน UserService ใน GetX
  Get.put(BottomNavController());
  Get.put(ThemeController());
  Get.put(LanguageController());
  runApp(const StarbucksApp());
}

class StarbucksApp extends StatelessWidget {
  const StarbucksApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final LanguageController languageController = Get.find();

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Starbucks',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.green,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: const Color.fromARGB(255, 37, 37, 37),
            textTheme: const TextTheme(
              titleLarge: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              bodyMedium: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
              bodySmall: TextStyle(color: Colors.green),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.white,
            ),
          ),
          themeMode: themeController.themeMode.value, // เชื่อมกับ controller
          // ใช้ themeMode จาก ThemeController

          // รองรับภาษา
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('th', ''), // ไทย
          ],
          locale: Locale(languageController.languageCode.value),
          translations: AppTranslations(),

          initialRoute: '/home',
          getPages: [
            GetPage(
              name: '/home',
              page: () => const HomeScreen(),
            ),
            GetPage(
              name: '/card',
              page: () => const CardScreen(),
            ),
            GetPage(
              name: '/order',
              page: () => const OrderScreen(),
            ),
            GetPage(
              name: '/address',
              page: () => const OrderAddressScreen(),
            ),
            GetPage(
              name: '/stores',
              page: () => const StoreListScreen(),
            ),
            GetPage(
              name: '/scanqr',
              page: () => const OrderScanQRScreen(),
            ),
            GetPage(
              name: '/inbox',
              page: () => const InboxScreen(),
            ),
            GetPage(
              name: '/account',
              page: () => const AccountScreen(),
            ),
            GetPage(
              name: '/signin',
              page: () => const SignInScreen(),
            ),
          ],
        ));
  }
}
