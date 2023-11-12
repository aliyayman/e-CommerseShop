import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/utility/constants/string_constants.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [Text(StringConstants.profileLabel)]),
    );
  }
}
