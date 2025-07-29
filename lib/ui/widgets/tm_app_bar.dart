import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import '../Screens/update_profile_screen.dart';

class TMAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TMAppBar({super.key, this.onUpdate});

  final VoidCallback? onUpdate;

  @override
  State<TMAppBar> createState() => _TMAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TMAppBarState extends State<TMAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: _onTapProfileBar,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AuthController.userModel?.photo == null
                  ? null
                  : MemoryImage(
                base64Decode(AuthController.userModel!.photo!),
              ),
              child: AuthController.userModel?.photo == null
                  ? const Icon(Icons.person)
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userModel?.fullName ?? 'Unknown User',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    AuthController.userModel?.email ?? 'no-email',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: _onTapLogOutButton, icon: const Icon(Icons.logout)),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapLogOutButton() async {
    await AuthController.clearData();
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInScreen.name,
            (predicate) => false,
      );
    }
  }

  Future<void> _onTapProfileBar() async {
    final result =
    await Navigator.pushNamed(context, UpdateProfileScreen.name) as bool?;
    if (result == true && widget.onUpdate != null) {
      widget.onUpdate!();
    }
  }
}