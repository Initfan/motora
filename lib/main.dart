import 'package:flutter/material.dart';
import 'package:motora/config/dependencies.dart';
import 'package:motora/utils/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(providers: dependencies, child: MotoraApp()));
}

class MotoraApp extends StatelessWidget {
  const MotoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'MotoCare Driver',
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);

        final isMobile = mediaQuery.size.width <= 600;

        final currentScale = mediaQuery.textScaler.scale(1.0);

        final typographyScale = isMobile ? 1.18 : 1.0;

        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: TextScaler.linear(currentScale * typographyScale),
          ),
          child: child!,
        );
      },

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFDFEFE),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0BAA50),
          brightness: Brightness.light,
        ),
      ),
      // home: Scaffold(
      //   body: FutureBuilder<String?>(
      //     future: TokenStorage().getToken(),
      //     builder: (context, snapshot) {
      //       if (snapshot.data != null) {
      //         return Motora();
      //       }
      //       return SplashScreen();
      //     },
      //   ),
      // ),
    );
  }
}
