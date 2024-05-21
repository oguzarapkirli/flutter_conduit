import 'package:conduit/data/api/model/user.dto.dart';
import 'package:conduit/data/provider/profile.provider.dart';
import 'package:conduit/data/provider/user.provider.dart';
import 'package:conduit/ui/component/app.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile/:username';
  final String? username;
  const ProfileScreen({super.key, this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  UserDTO? profile;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      isLoading: isLoading,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      child: Text('slug ${widget.username}'),
    );
  }

  void fetchProfile() async {
    setState(() {
      isLoading = true;
    });

    if (widget.username != null) {
      final response =
          await Provider.of<ProfileProvider>(context, listen: false)
              .getProfile(username: widget.username!);
      setState(() {
        profile = response;
      });
    } else {
      final response =
          await Provider.of<UserProvider>(context, listen: false).getUser();
      setState(() {
        profile = response.toUserDTO();
      });
    }

    setState(() {
      isLoading = false;
    });
  }
}
