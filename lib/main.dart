import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/book_ticket.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/provider/provider.dart';
import 'package:flutter_cinema_app/provider/search_provider.dart';
import 'package:flutter_cinema_app/provider/seat_provider.dart';
import 'package:flutter_cinema_app/provider/user.dart';
import 'package:flutter_cinema_app/widgets/key_board_dismiss.dart';
import 'package:flutter_cinema_app/widgets/loading_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/show_loading_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  if (token != null && token.isNotEmpty) {
    AppRoutes.initial = AppRoutes.homePage;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => BookTicket()),
        ChangeNotifierProvider(create: (_) => SeatProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
      ],
      builder: (context, _) {
        final languageProvider = Provider.of<LanguageProvider>(context);
        return Consumer<LoadingProvider>(builder: (context, loading, child) {
          return ScreenUtilInit(
              builder: (context, child) => KeyboardDismiss(
                    child: MaterialApp(
                      builder: EasyLoading.init(),
                      debugShowCheckedModeBanner: false,
                      home: Stack(
                        children: [
                          MaterialApp(
                            initialRoute: AppRoutes.initial,
                            debugShowCheckedModeBanner: false,
                            routes: AppRoutes.routes,
                            localizationsDelegates: const [
                              S.delegate,
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                            ],
                            supportedLocales: S.delegate.supportedLocales,
                            locale: languageProvider.locale, // Set the current locale),
                          ),
                          loading.isLoading ? const LoadingWidget() : const SizedBox.shrink()
                        ],
                      ),
                    ),
                  ));
        });
      },
    );
  }
}
