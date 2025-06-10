import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/controller/theme_controller.dart';
import 'package:starbucks_app/controller/language_controller.dart';
import 'package:starbucks_app/pages/join_now.dart';
import 'package:starbucks_app/pages/sign_in.dart';
import 'package:starbucks_app/pages/widgets/bottom_nav_bar.dart';
import 'package:starbucks_app/service/user_service.dart';
import 'package:starbucks_app/data/mock_user.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    final userService = Get.find<UserService>();
    final ThemeController themeController = Get.find();
    final LanguageController languageController = Get.find();

    final bool isLoggedIn = userService.isLoggedIn;
    final user = userService.currentUser.value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const SizedBox.shrink(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              children: [
                const SizedBox(height: 16),
                // ชื่อผู้ใช้หรือ Account
                Align(
                  alignment: Alignment.centerLeft,
                  child: isLoggedIn
                      ? Text(
                          user!.name,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        )
                      : const Text(
                          'Account',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(height: 16),
                // ปุ่ม sign in/join now เมื่อ sign out
                if (!isLoggedIn)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF00704A),
                            backgroundColor: const Color(0xFFF2FBF6),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
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
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00704A),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const JoinNowScreen()),
                            );
                          },
                          child: const Text(
                            'Join now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (!isLoggedIn) const SizedBox(height: 24),

                // เมนูเมื่อ sign in
                if (isLoggedIn) ...[
                  const SizedBox(height: 24),
                  _sectionTitle('ACCOUNT DETAILS'),
                  _accountMenu(
                    title: 'Your mobile order(s)',
                    icon: Icons.receipt_long,
                    onTap: () {},
                  ),
                  _accountMenu(
                    title: 'My credit / debit cards',
                    icon: Icons.credit_card,
                    onTap: () {},
                  ),
                  _accountMenu(
                    title: 'Delivery address',
                    icon: Icons.location_on,
                    onTap: () {},
                  ),
                  _accountMenu(
                    title: 'Personal information',
                    icon: Icons.person,
                    onTap: () {},
                  ),
                  _accountMenu(
                    title: 'Starbucks® Rewards',
                    icon: Icons.star,
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  _divider(),
                ],

                // SETTINGS
                _sectionTitle('SETTINGS'),
                _simpleMenu(
                  title: 'General',
                  onTap: () {},
                ),
                if (isLoggedIn)
                  _simpleMenu(
                    title: 'Security',
                    onTap: () {},
                  ),
                // Language
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 0, right: 0),
                  title: const Text('Language',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  trailing: DropdownButton<String>(
                    value: _language,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                          value: 'English', child: Text('English')),
                      DropdownMenuItem(value: 'ไทย', child: Text('ไทย')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _language = value;
                        });
                        languageController
                            .setLanguage(value == 'English' ? 'en' : 'th');
                      }
                    },
                  ),
                  onTap: null,
                ),
                const SizedBox(height: 8),
                _divider(),

                // ABOUT
                _sectionTitle('ABOUT'),
                _simpleMenu(
                  title: 'FAQs',
                  onTap: () {},
                ),
                _simpleMenu(
                  title: 'Terms of use',
                  onTap: () {},
                ),
                _simpleMenu(
                  title: 'Privacy policy',
                  onTap: () {},
                ),
                _simpleMenu(
                  title: 'Feedback',
                  onTap: () {},
                ),
                _simpleMenu(
                  title: 'Tell a friend',
                  onTap: () {},
                ),
                if (isLoggedIn) ...[
                  const SizedBox(height: 8),
                  _divider(),
                  // Delete account (แยกเดี่ยว)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 0, right: 0),
                      title: const Text(
                        'Delete account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      trailing:
                          const Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {},
                      minLeadingWidth: 0,
                      horizontalTitleGap: 0,
                    ),
                  ),
                  _divider(),
                  const SizedBox(height: 24),
                ],
              ],
            ),
          ),
          // Sign out button (เฉพาะตอนล็อกอิน)
          if (isLoggedIn)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 180,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          side:
                              const BorderSide(color: Colors.green, width: 1.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () async {
                          final result = await showDialog<bool>(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => _signOutDialog(context),
                          );
                          if (result == true) {
                            userService.logout();
                            setState(() {});
                          }
                        },
                        child: const Text(
                          'Sign out',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'App version 7.2.4',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 13, letterSpacing: 0.2),
                    ),
                  ),
                ],
              ),
            ),
          if (!isLoggedIn)
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'App version 7.2.4',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 13, letterSpacing: 0.2),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 8),
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 1.2,
            fontSize: 13,
          ),
          textAlign: TextAlign.left,
        ),
      );

  Widget _accountMenu(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0, right: 0),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.normal)),
      trailing: CircleAvatar(
        backgroundColor: Colors.grey[200],
        radius: 18,
        child: Icon(icon, color: Colors.black, size: 20),
      ),
      onTap: onTap,
      minLeadingWidth: 0,
      horizontalTitleGap: 0,
    );
  }

  Widget _simpleMenu({required String title, required VoidCallback onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0, right: 0),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.normal)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
      minLeadingWidth: 0,
      horizontalTitleGap: 0,
    );
  }

  Widget _divider() => const Divider(
        color: Color(0xFFE0E0E0),
        thickness: 1,
        height: 32,
      );

  // Dialog ยืนยัน sign out
  Widget _signOutDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sign me out',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 16),
            const Text(
              'Are you sure you want to sign out?',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF00704A),
                      backgroundColor: const Color(0xFFF2FBF6),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text(
                      'Sign out',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00704A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text(
                      'Not now',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
