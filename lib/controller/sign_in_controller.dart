// lib/controllers/sign_in_controller.dart
import 'package:flutter/material.dart';

class SignInController with ChangeNotifier {
  // State สำหรับการล็อกอิน
  bool _isLoading = false;
  String? _errorMessage;

  // Getter
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // ฟังก์ชันสำหรับการล็อกอิน
  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // จำลองการล็อกอิน (ในโปรเจคจริงจะเชื่อมกับ API)
      await Future.delayed(const Duration(seconds: 2));

      // ตรวจสอบข้อมูลล็อกอิน (ตัวอย่างเท่านั้น)
      if (email.isEmpty || password.isEmpty) {
        throw Exception('กรุณากรอกอีเมลและรหัสผ่าน');
      }

      if (!email.contains('@')) {
        throw Exception('รูปแบบอีเมลไม่ถูกต้อง');
      }

      // ล็อกอินสำเร็จ - นำทางไปหน้าหลัก
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // เคลียร์ error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
