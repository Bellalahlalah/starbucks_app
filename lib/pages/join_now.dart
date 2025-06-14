import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'sign_in');
            },
            child: const Text('Sign in',
                style: TextStyle(
                    color: Color(0xFF00704A), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text('Join now',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 24),
            const Text('Enter your email', style: TextStyle(fontSize: 16)),
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
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.grey),
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
            const Text(
              'A verification link will be sent to this email',
              style: TextStyle(color: Colors.black54),
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
                child: const Text('Join now',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 24),
            if (_submitted)
              Center(
                child: Text(
                  'A verification link will be sent to ${_emailController.text}',
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
