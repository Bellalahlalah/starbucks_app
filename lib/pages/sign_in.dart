import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

//Controller of Function Show, Hide Text and Fn. Button when input data
class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {}); // อัพเดทสถานะปุ่มเมื่อมีการเปลี่ยนแปลงข้อความ
  }

  bool get _isFormValid {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(100), // ความสูงรวมของ AppBar + ระยะห่าง
        child: Container(
          padding: const EdgeInsets.only(top: 48), // ระยะห่างจาก Status Bar
          color: Colors.white,
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 56, // ความสูงของ AppBar จริงๆ
            leading: IconButton(
              icon:
                  const Icon(Icons.chevron_left, size: 30, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton(
                  onPressed: () {
                    // ใส่การทำงานเมื่อกด Join now
                  },
                  child: const Text(
                    'Join now',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
            titleSpacing: 0, // ลบช่องว่างด้านซ้ายของ title
          ),
        ),
      ),

      //Sign in Text ,Email and Pasword Box
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ข้อความ "Sign in" ที่เพิ่มเข้ามา
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            //Email feild
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 194, 194, 194)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //Password Field
            TextField(
              controller: _passwordController,
              obscureText: _obscureText, // ใช้ค่าจาก state
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: TextButton(
                  child: Text(
                    _obscureText ? 'Show' : 'Hide',
                    style: const TextStyle(
                      color: Colors.green, // สีเขียวเหมือน Starbucks
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // สลับสถานะการแสดงผล
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ส่วนของ Forgot password? และ Stay signed in
            Column(
              children: [
                const Divider(thickness: 1),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Forgot password? (ชิดซ้าย)
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // Stay signed in (ชิดขวา)
                    Row(
                      children: [
                        const Text(
                          'Stay signed in',
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: true, // กำหนดค่าเริ่มต้น
                          onChanged: (bool value) {
                            // ใส่ logic เมื่อเปลี่ยนค่า
                          },
                          activeColor: const Color(0xFF106214), // สีเมื่อเปิด
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            //sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFormValid
                      ? const Color(0xFF006241) // สีเขียวเมื่อกรอกครบ
                      : Colors.grey, // สีเทาเมื่อยังไม่กรอก
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _isFormValid
                    ? () {
                        // ทำงานเมื่อกดปุ่ม Sign In
                        Navigator.pop(context);
                      }
                    : null, // ปิดการทำงานเมื่อปุ่มไม่ active
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
