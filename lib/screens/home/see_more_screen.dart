import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_background_theme.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/provider/search_provider.dart';
import 'package:flutter_cinema_app/widgets/key_board_dismiss.dart';
import 'package:provider/provider.dart';

class SeeMoreScreen extends StatefulWidget {
  const SeeMoreScreen({super.key});

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    return KeyboardDismiss(
      child: Consumer<SearchProvider>(builder: (context, search, child) {
        return Container(
          decoration: AppBackGroundTheme.searchTheme,
          child: const Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Text(
                "Not results found",
                style: TextStyle(color: AppTheme.white),
              ),
            ),
          ),
        );
      }),
    );
  }
}
