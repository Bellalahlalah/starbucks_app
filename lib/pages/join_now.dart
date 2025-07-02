import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/pages/sign_in.dart';

class JoinNowScreen extends StatefulWidget {
  const JoinNowScreen({super.key});

  @override
  State<JoinNowScreen> createState() => _JoinNowScreenState();
}

class _JoinNowScreenState extends State<JoinNowScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _emailValid = false;
  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          padding: const EdgeInsets.only(top: 48),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.chevron_left,
                  color: Theme.of(context).textTheme.titleLarge?.color),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton(
                  onPressed: () async {
                    //ไปหน้า sign in
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                    );
                    if (result == true) {
                      setState(() {});
                    }
                  },
                  child: Text('Sign in'.tr,
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text('Join now'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Theme.of(context).textTheme.titleLarge?.color)),
            const SizedBox(height: 24),
            Text('Enter your email'.tr,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.titleLarge?.color)),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  _emailValid = value.contains('@') && value.contains('.');
                });
              },
              decoration: InputDecoration(
                hintText: 'Email'.tr,
                hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.titleLarge?.color),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color:
                          _emailValid ? const Color(0xFF00704A) : Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color:
                          _emailValid ? const Color(0xFF00704A) : Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'A verification link will be sent to this email'.tr,
              style: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  fontSize: 14),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _emailValid ? const Color(0xFF00A862) : Colors.grey[300],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                onPressed: _emailValid
                    ? () {
                        setState(() {
                          _submitted = true;
                        });
                      }
                    : null,
                child: Text('Join now'.tr,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 24),
            if (_submitted)
              Center(
                child: Text(
                  'A verification link will be sent to ${_emailController.text}'
                      .tr,
                  style: const TextStyle(color: Colors.green, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
